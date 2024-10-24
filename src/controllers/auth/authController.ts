import { Request, Response } from "express";
import logger from "../../utils/winston";
import authService from "../../services/auth/authService";
var jwt = require("jsonwebtoken");
import crypto from "crypto";
import axios from "axios";
const https = require("https");

// Create an HTTPS agent that ignores self-signed certificates
const httpsAgent = new https.Agent({
  rejectUnauthorized: false, // Disable SSL certificate validation
});

const signin = async (req: Request, res: Response) => {
  try {
    const { userName, password } = req.body;
    logger.info(`Sign In start for username : ${userName}`);
    let hashedPassword = hashPassword(password);
    const user = await authService.signin(userName, hashedPassword);
    const permission = await authService.getPermission(user.id);
    if (user) {
      let data = {
        token: jwt.sign(user, process.env.SECRET_KEY, { algorithm: "HS256" }),
        type: user.user_type,
        username: user.username,
        name: user.first_name + " " + user.last_name,
        id: user.id,
        cellphone: user.cell_number,
        avatar: user.avatar,
        user_type: user.user_type,
        permissions: permission,
      };
      logger.info(`Sign In completed for username : ${userName}`);
      res
        .status(200)
        .json({ status: true, message: "Logged in successfully", data: data });
    } else {
      logger.debug(`Invalid username or password : ${userName}`);
      res
        .status(400)
        .json({ status: false, message: "Invalid username or password" });
    }
  } catch (error) {
    logger.error(`Error signin in: - ${error}`);
    res
      .status(500)
      .json({ status: false, message: "An error occurred while signing in" });
  }
};

const omadaSignin = async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;
    const LOGIN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/login?client_id=";
    const AUTH_TOKEN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/code?client_id=";
    const ACCESS_TOKEN =
      process.env.REACT_APP_OMADA_BASE_URL +
      "openapi/authorize/token?grant_type=";

    console.log(LOGIN);
    const loginResponse = await axios.post(
      LOGIN +
        `${process.env.REACT_APP_CLIENT_ID}&omadac_id=${process.env.REACT_APP_OMADA_ID}`,
      {
        username: "api-user",
        password: "Snm@2024",
      },
      { httpsAgent }
    );
    
    // Step 2: Extract CSRF token and session ID
    // console.log(loginResponse.data)
    const { csrfToken, sessionId } = loginResponse.data;
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
        httpsAgent
      },
    );

    // Step 4: Extract the authorization code from the response
    const { result } = authTokenResponse.data;
    console.log(authTokenResponse.data);

    // Step 5: Call GetAccessToken with the authorization code
    let data = {
      client_id: process.env.REACT_APP_CLIENT_ID,
      client_secret: process.env.REACT_APP_CLIENT_SECRET,
    };
    const accessTokenResponse = await axios.post(
      ACCESS_TOKEN + `authorization_code&code=${result || authTokenResponse.data.result}`,
      data,
      { httpsAgent }
    );

    // Step 6: Extract the access and refresh tokens
    console.log(accessTokenResponse.data);
    const { accessToken, refreshToken } = accessTokenResponse.data.result;

    // Return the tokens to the frontend
    res.json({ accessToken, refreshToken });
  } catch (err) {
    console.log(err);
  }
};

const hashPassword = (password: string): string => {
  return crypto.createHash("md5").update(password).digest("hex");
};

export default {
  signin,
  omadaSignin,
};
