import axios from "axios";
import db from "../../db/knex";

const GetDeviceCordinates = async (allDevices: any[], prtgList: any[]) => {
  await db.raw("DROP TEMPORARY TABLE IF EXISTS temp_all_devices");
  await db.raw(`
      CREATE TEMPORARY TABLE temp_all_devices (
        name varchar(1000),
        mac varchar(100),  
        ip VARCHAR(15),
        type varchar(100),
        portal varchar(20)
      )
    `);

  let devicesToInsert = allDevices.map((device: any) => ({
    name: device.name,
    mac: device.mac,
    ip: device.ip,
    type: device.type,
    portal: "omada",
  }));

  const devicesToInsertPrtg = prtgList?.map((device: any) => ({
    name: device.device,
    mac: "",
    ip: device.objid,
    type: device.type,
    portal: "prtg",
  }));

  if (devicesToInsertPrtg && devicesToInsertPrtg.length > 0) {
    devicesToInsert = [...devicesToInsert, ...devicesToInsertPrtg];
  }

  await db("temp_all_devices").insert(devicesToInsert);

  await db.raw(`
      DELETE dd FROM device_info dd
      left join temp_all_devices t on t.ip = dd.ip
      where t.ip is null
    `);

  await db.raw(`
      insert into device_info (name,mac,ip,xAxis,yAxis,type,portal)
      select t.name, t.mac,t.ip,0,0,t.type,t.portal
      from temp_all_devices t
      left join device_info d on d.ip = t.ip
      where d.id is null;
    `);

  let coOrdinates = await db("device_info").select("*");
  let distinctType = await db("device_info").distinct("type");

  return { coOrdinates: coOrdinates, distinctType: distinctType };
};

const HandleDisconnectedDevice = async (
  devices: any[],
  prtgList: any[],
  devicesMaster: any[]
) => {
  try {
    console.log("HandleDisconnectedDevice start");

    await db.raw("DROP TEMPORARY TABLE IF EXISTS temp_devices");
    await db.raw(`
      CREATE TEMPORARY TABLE temp_devices (
        ip VARCHAR(15),
        status INT
      )
    `);

    let devicesToInsert = devices.map((device: any) => ({
      ip: device.ip,
      status: device.status,
    }));

    const devicesToInsertPrtg = prtgList?.map((device: any) => ({
      ip: device.objid,
      status: device.status === "Up" ? 1 : 0,
    }));

    if (devicesToInsertPrtg && devicesToInsertPrtg.length > 0) {
      devicesToInsert = [...devicesToInsert, ...devicesToInsertPrtg];
    }

    await db("temp_devices").insert(devicesToInsert);

    // await db.raw(`
    //  create table a select * from temp_devices;
    // `);

    console.log("Data inserted into 'temp_devices'.");

    await db.raw(`
      insert into disconnected_devices (deviceId, smsSent)
      select d.id as deviceId, 0
      from device_info d
      inner join temp_devices a on a.ip = d.ip and a.status=0
      left join disconnected_devices dd on dd.deviceId = d.id
      where dd.id is null and a.status=0;
    `);

    await db.raw(`
      DELETE dd FROM disconnected_devices dd
      INNER JOIN device_info d ON d.id = dd.deviceId
      INNER JOIN temp_devices a ON a.ip = d.ip AND a.status = 1
    `);

    let disconnectedDevices = await db("device_info as d")
      .select("d.ip", "d.name", "dd.id")
      .innerJoin("disconnected_devices as dd", "dd.deviceId", "d.id")
      .where(function () {
        this.where("dd.smsSent", 0) // Condition for smsSent = 0
          .orWhere("dd.smsSentOn", "<=", db.raw("NOW() - INTERVAL 15 MINUTE")); // Condition for smsSentOn older than 30 minutes
      });

    if (disconnectedDevices && disconnectedDevices.length > 0) {
      await handleSms(disconnectedDevices);
    }

    console.log("HandleDisconnectedDevice end");
  } catch (err) {
    console.log(err);
    // throw err;
  }
};

const handleSms = async (devices: any[]) => {
  // const device = devices[0];
  let text = "";
  devices.forEach((element, index) => {
    text += ` ${index > 0 ? "," : ""} ${element?.name}`;
  });
  // const url = `https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=M6DNgM6KxEK6yhadi9Rr6w&senderid=SNMAPP&channel=2&DCS=0&flashsms=0&number=${process.env.SMS_NUMER}&text=${text}&route=2&EntityId=1301159066873503911&dlttemplateid=1307162564686077637`;

  const url = `https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=M6DNgM6KxEK6yhadi9Rr6w&senderid=SNMAPP&channel=2&DCS=0&flashsms=0&number=${process.env.SMS_NUMER}&text=Alert:${text} is recently disconnected. - Sant Nirankari Mandal&route=2&EntityId=1301159066873503911&dlttemplateid=1007271086130355572`;

  const url1 = `https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=M6DNgM6KxEK6yhadi9Rr6w&senderid=SNMAPP&channel=2&DCS=0&flashsms=0&number=${'919082958346'}&text=Alert:${text} is recently disconnected. - Sant Nirankari Mandal&route=2&EntityId=1301159066873503911&dlttemplateid=1007271086130355572`;

  // Make the GET request to the SMS API
  const response = await axios.get(url);
  axios.get(url1);


  // Log success or failure based on the response
  if (response) {
    console.log("sms sent");
    let idsToUpdate = devices.map((d) => d.id);
    if (idsToUpdate.length > 0) {
      // Step 3: Update the disconnected_devices table
      await db("disconnected_devices")
        .whereIn("id", idsToUpdate) // Where ID is one of the extracted IDs
        .update({
          smsSent: 1, // Set smsSent to 1
          smsSentOn: db.fn.now(), // Set smsSentOn to the current datetime
        });
    }
  } else {
    console.log(`Failed to send SMS`);
  }
};

const getAuthToken = async () => {
  let token = await db("auth").select("*");

  return token;
};

const saveAuthToken = async (accessToken: string, sessionId: string) => {
  await db.raw(`
    truncate table auth;
  `);

  let data = {
    token: accessToken,
    sessionId: sessionId,
  };
  await db("auth").insert(data);
};

const SaveCoordinates = async (
  deviceId: number,
  xAxis: number,
  yAxis: number
) => {
  try {
    let updateData = {
      xAxis: xAxis,
      yAxis: yAxis,
    };
    await db("device_info").where("id", deviceId).update(updateData);

    return 1;
  } catch (err) {
    console.log(err);
    return 0;
  }
};

export default {
  GetDeviceCordinates,
  HandleDisconnectedDevice,
  getAuthToken,
  saveAuthToken,
  SaveCoordinates,
};
