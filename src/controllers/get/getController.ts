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
      .then(async (response) => {
        if (response.data.errorCode === -44112) {
          return res.status(400).send(response.data);
        } else {
          const allDevices = response.data.result.data;
          let coOrdinates = await getService.GetDeviceCordinates(allDevices);
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

// const updateDisconnectedDevices = async() => {
//   try {
//     let coOrdinates = await getService.GetDeviceCordinates();

//   } catch (error) {
//     console.error("Error updating disconnected devices:", error);
//   }
// }

const PrtgList = async (req: Request, res: Response) => {
  try {
    let config = {
      method: "get",
      maxBodyLength: Infinity,
      url: `http://prtg.snmitapps.org:5433/api/table.json?content=devices&columns=objid,group,device,sensor,status,message,lastvalue,priority,favorite,host&count=*&apiToken=RYU3DGV72XUZA6EROX3FTY46MXGI3KQN46ZVJ3GU3A======`,
    };

    axios.request(config).then((response) => {

      return res.json(response.data);
    });
  } catch (err) {
    console.log(err);
    return res.json(err);
  }
};
export default {
  GetDeviceData,
  PrtgList,
};

export const GetDeviceDataCron = async () => {
  console.log("started cron");
  try {
    let data = qs.stringify({
      response_type: "code",
    });

    let token: string = "";
    let sessionId: string = "";

    let authToken = await getService.getAuthToken();
    if (authToken && authToken.length > 0) {
      console.log("got token from db");
      token = authToken[0].token;
      sessionId = authToken[0].sessionId;
    } else {
      console.log("signing in to get tokens");
      let tokens: any = await omadaSignin();
      if (tokens) {
        console.log("got tokens");
        token = tokens.accessToken;
        sessionId = tokens.sessionId;
      } else {
        console.log("failed sign in");
        return;
      }
    }

    const agent = new https.Agent({
      rejectUnauthorized: false, // Disable SSL certificate validation
    });

    console.log("fetching device list");
    let config = {
      method: "get",
      maxBodyLength: Infinity,
      url: `${process.env.REACT_APP_OMADA_BASE_URL}openapi/v1/${process.env.REACT_APP_OMADA_ID}/sites/${process.env.REACT_APP_SITE_ID}/devices?page=1&pageSize=80`,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        Authorization: `AccessToken=${token}`,
        Cookie: `TPOMADA_SESSIONID=${sessionId}`,
      },
      data: data,
      httpsAgent: agent,
    };

    axios
      .request(config)
      .then(async (response) => {
        if (response.data.errorCode === -44112) {
          console.log("expired token, signing in again");
          let tokens: any = await omadaSignin();
          if (tokens) {
            GetDeviceDataCron();
            return;
          } else {
            return;
          }

          // return res.status(400).send(response.data);
          // login again and generate the tokens
        } else {
          console.log("got devices");
          const allDevices = response.data.result.data;
          let coOrdinates = await getService.GetDeviceCordinates(allDevices);
          getService.HandleDisconnectedDevice(allDevices, coOrdinates);
        }
      })
      .catch((error) => {
        console.log(error);
        // return res.json(error);
      });
      console.log("job finish");
  } catch (err) {
    console.log(err);
    // return res.json(err);
  }
};

const omadaSignin = async () => {
  try {
    const username = "api-user";
    const password = "Snm@2024";
    const LOGIN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/login?client_id=";
    const AUTH_TOKEN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/code?client_id=";
    const ACCESS_TOKEN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/token?grant_type=";

    const loginResponse: any = await axios.post(
      LOGIN +
        `${process.env.REACT_APP_CLIENT_ID}&omadac_id=${process.env.REACT_APP_OMADA_ID}`,
      {
        username: username,
        password: password,
      },
      { httpsAgent }
    );
    // console.log(loginResponse);
    if (loginResponse.data.errorCode === -30109) {
      // res.send({ status: 400, message: "Invalid Username or Password" });
      console.log("invalid username or password");
      return 0;
    } else {
      // Step 2: Extract CSRF token and session ID
      // console.log(loginResponse.data)

      const sessionId = loginResponse.data.result.sessionId;
      // console.log(sessionId);
      // console.log(csrfToken, sessionId);

      // Step 3: Call GetAuthToken with CSRF token and session ID
      const authTokenResponse = await axios.post(
        AUTH_TOKEN +
          `${process.env.REACT_APP_CLIENT_ID}&omadac_id=${process.env.REACT_APP_OMADA_ID}&response_type=code`,
        {},
        {
          headers: {
            "Csrf-Token": loginResponse.data.result.csrfToken,
            Cookie: "TPOMADA_SESSIONID=" + loginResponse.data.result.sessionId,
          },
          httpsAgent,
        }
      );

      // Step 4: Extract the authorization code from the response
      const { result } = authTokenResponse.data;
      // console.log(authTokenResponse.data);

      // Step 5: Call GetAccessToken with the authorization code
      let data = {
        client_id: process.env.REACT_APP_CLIENT_ID,
        client_secret: process.env.REACT_APP_CLIENT_SECRET,
      };
      const accessTokenResponse = await axios.post(
        ACCESS_TOKEN +
          `authorization_code&code=${result || authTokenResponse.data.result}`,
        data,
        { httpsAgent }
      );

      // Step 6: Extract the access and refresh tokens
      // console.log(accessTokenResponse.data);
      const { accessToken, refreshToken } = accessTokenResponse.data.result;

      // Return the tokens to the frontend
      await getService.saveAuthToken(accessToken, sessionId);
      return { accessToken, sessionId };
    }
  } catch (err) {
    console.log(err);
  }
};
