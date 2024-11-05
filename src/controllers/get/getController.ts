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
const GetMethod = async (req: Request, res: Response) => {
  try {
    const { type } = req.body;
    let result: any = [];
    logger.info(`Get Method start for type : ${type}`);
    if (type === "10") {
      result = await getDashboardData();
    } else {
      result = await getService.GetMethod(req.body);
    }
    logger.info(`Get Method Completed for type : ${type}`);
    res
      .status(200)
      .json({ status: true, message: "Get successfully", data: result });
  } catch (error) {
    logger.error(`Get Method call failed with error: - ${error}`);
    res.status(500).json({
      status: false,
      message: "An error occurred while getting results",
    });
  }
};

const getDashboardData = async () => {
  let result = {
    counts: await getService.GetMethod({ type: "10" }),
    request: await getService.GetMethod({ type: "6" }),
  };

  return [result];
};

const GetByIdMethod = async (req: Request, res: Response) => {
  try {
    const { type } = req.body;
    logger.info(`Get  By Id start for type : ${type}`);
    const result = await getService.GetByIdMethod(req.body);
    logger.info(`Get  By Id Completed for type : ${type}`);
    res
      .status(200)
      .json({ status: true, message: "Get successfully", data: result });
  } catch (error) {
    logger.error(`Get  By Id call failed with error: - ${error}`);
    res.status(500).json({
      status: false,
      message: "An error occurred while getting results",
    });
  }
};

const GetDeviceData = async (req: Request, res: Response) => {
  try {
    let coOrdinates = await getService.GetDeviceCordinates();
    // console.log(coOrdinates);

    let data = qs.stringify({
      response_type: "code",
    });

    console.log("first data " + data);

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
          // console.log(response.data);
          const allDevices = response.data.result.data;
          // console.log(allDevices);
          // handleDisconnectedDevices(allDevices);
          getService.HandleDisconnectedDevice(allDevices);
          let returnData = allDevices;
          if (!req.body.requireCod) {
            coOrdinates.forEach((data) => {
              let device = allDevices.find(
                (d: any) => d.mac === data.mac
              );
              if (device) {
                // allDevices[deviceIndex]["xAxis"] = data.xAxis;
                // allDevices[deviceIndex]["yAxis"] = data.yAxis;
                data['status'] = device.status
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

    // console.log(deviceResponse);
  } catch (err) {
    console.log(err);
    return res.json(err);
  }
};

export default {
  GetMethod,
  GetByIdMethod,
  GetDeviceData,
};
