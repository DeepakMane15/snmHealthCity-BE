import axios from "axios";
import db from "../../db/knex"; // Adjust path to knex.ts

const GetDeviceCordinates = async () => {
  return await db("device_info").select("*");
};

const HandleDisconnectedDevice = async (
  devices: any[],
  devicesMaster: any[]
) => {
  try {
    console.log("HandleDisconnectedDevice start");
    const disconnected = devices.filter((d) => d.status === 0);
    const connected = devices.filter((d) => d.status === 1);
    const ip = disconnected.map((d) => d.ip);
    const devicesIpsMaster = devicesMaster.filter((d) => ip.includes(d.ip));

    const addedDeviceIds = new Set<number>();

    let allDevices = await db("disconnected_devices")
      .join("device_info as d", "d.id", "=", "disconnected_devices.deviceId")
      .select("d.id as id", "d.ip as ip", "disconnected_devices.id as did");

    let newDisconncted: any[] = [];
    let newConnected: number[] = [];

    if (allDevices && allDevices.length > 0) {
      disconnected.forEach((d) => {
        let existingDevice = allDevices.find((al) => al.ip === d.ip);
        if (!existingDevice) {
          let device = devicesMaster.find((masterDevice) => masterDevice.ip === d.ip);
          if (device && !addedDeviceIds.has(device.id)) {
            newDisconncted.push({ deviceId: device.id });
            addedDeviceIds.add(device.id); // Mark this deviceId as added
          }
        }
      });

      connected.forEach((c) => {
        let dd = allDevices?.find((a) => a.ip === c.ip);
        if (dd) {
          newConnected.push(dd.did);
        }
      });
    } else {
      console.log(devicesIpsMaster);
      devicesIpsMaster.forEach((d) => {
        newDisconncted.push({ deviceId: d.id });
      });
    }

    if (newDisconncted.length > 0) {
      console.log("Inserting new disconnected devices...");
      await db("disconnected_devices").insert(newDisconncted);
      console.log("Insertion complete.");
    }

    let sendSmsDeviceList: any[] = [];
    newDisconncted.forEach((d) => {
      let device = devicesMaster.find((i) => i.id === d.deviceId);
      sendSmsDeviceList.push(device);
    });
    if (sendSmsDeviceList.length > 0) handleSms(sendSmsDeviceList);
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
    text += ` ${index > 0 ? ',' : ''} ${element?.name}`;
  });
  // const url = `https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=M6DNgM6KxEK6yhadi9Rr6w&senderid=SNMAPP&channel=2&DCS=0&flashsms=0&number=${process.env.SMS_NUMER}&text=${text}&route=2&EntityId=1301159066873503911&dlttemplateid=1307162564686077637`;

  const url = `https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=M6DNgM6KxEK6yhadi9Rr6w&senderid=SNMAPP&channel=2&DCS=0&flashsms=0&number=${process.env.SMS_NUMER}&text=Alert:${text} is recently disconnected. - Sant Nirankari Mandal&route=2&EntityId=1301159066873503911&dlttemplateid=1007271086130355572`

  // Make the GET request to the SMS API
  const response = await axios.get(url);

  // Log success or failure based on the response
  if (response.data && response.data.status === "success") {
    console.log(`SMS sent successfully`);
  } else {
    console.log(`Failed to send SMS`);
  }
};

export default {
  GetDeviceCordinates,
  HandleDisconnectedDevice,
};
