import { Request, Response } from "express";
import logger from "../../utils/winston";
import authService from "../../services/auth/authService";
var jwt = require("jsonwebtoken");
import crypto from "crypto";
import getService from "../../services/get/getService";
import axios from "axios";
const https = require("https");
const qs = require("qs");

// Create an HTTPS agent that ignores self-signed certificates
const httpsAgent = new https.Agent({
  rejectUnauthorized: false, // Disable SSL certificate validation
});

const GetDeviceData = async (req: Request, res: Response) => {
  try {
    let coOrdinates = await getService.GetDeviceCordinates();

    let data = qs.stringify({
      response_type: "code",
    });

    const agent = new https.Agent({
      rejectUnauthorized: false, // Disable SSL certificate validation
    });

    let config = {
      method: "get",
      maxBodyLength: Infinity,
      url: `${process.env.REACT_APP_OMADA_BASE_URL}openapi/v1/${process.env.REACT_APP_OMADA_ID}/sites/${process.env.REACT_APP_SITE_ID}/devices?page=1&pageSize=80`,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        Authorization: `AccessToken=${req.body.token}`,
        Cookie: `TPOMADA_SESSIONID=${req.body.sessionId}`,
      },
      data: data,
      httpsAgent: agent,
    };

    axios
      .request(config)
      .then((response) => {
        if (response.data.errorCode === -44112) {
          return res.status(400).send(response.data);
        } else {
          const allDevices = response.data.result.data;
          getService.HandleDisconnectedDevice(allDevices, coOrdinates);
          let returnData = allDevices;
          if (!req.body.requireCod) {
            coOrdinates.forEach((data) => {
              let device = allDevices.find((d: any) => d.mac === data.mac);
              if (device) {
                data["status"] = device.status;
              }
            });
            returnData = coOrdinates;
          }

          return res.json(returnData);
        }
      })
      .catch((error) => {
        console.log(error);
        return res.json(error);
      });
  } catch (err) {
    console.log(err);
    return res.json(err);
  }
};

const PrtgList = async (req: Request, res: Response) => {
  try {
    let config = {
      method: "get",
      maxBodyLength: Infinity,
      url: `http://prtg.snmitapps.org:5433/api/table.json?content=devices&columns=objid,probe,group,device,host&count=*&apiToken=RYU3DGV72XUZA6EROX3FTY46MXGI3KQN46ZVJ3GU3A======`,
    };

    axios.request(config).then((response) => {
      console.log(response.data);

      return res.json(response.data);
    });
  } catch (err) {
    console.log(err);
    return res.json(err);
  }
};
export default {
  GetDeviceData,
  PrtgList
};
