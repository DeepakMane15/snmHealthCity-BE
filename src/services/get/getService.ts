import axios from "axios";
import db from "../../db/knex";

const GetDeviceCordinates = async () => {
  return await db("device_info").select("*");
};

const HandleDisconnectedDevice = async (
  devices: any[],
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

    const devicesToInsert = devices.map((device: any) => ({
      ip: device.ip,
      status: device.status,
    }));

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
          .orWhere("dd.smsSentOn", "<=", db.raw("NOW() - INTERVAL 30 MINUTE")); // Condition for smsSentOn older than 30 minutes
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

  // Make the GET request to the SMS API
  const response = await axios.get(url);

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

export default {
  GetDeviceCordinates,
  HandleDisconnectedDevice,
};
