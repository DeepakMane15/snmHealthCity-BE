import { Request, Response } from "express";
import logger from "../../utils/winston";
import authService from "../../services/auth/authService";
var jwt = require("jsonwebtoken");
import crypto from "crypto";
import getService from "../../services/get/getService";

const GetMethod = async (req: Request, res: Response) => {
  try {
    const { type } = req.body;
    let result:any = [];
    logger.info(`Get Method start for type : ${type}`);
    if(type === '10') {
      result["counts"] = await getService.GetMethod(req.body);
      result["request"] = await getService.GetMethod({type:'6'});
    }
    else {
    result = await getService.GetMethod(req.body);
    }
      logger.info(`Get Method Completed for type : ${type}`);
      res.status(200).json({ status: true, message: "Get successfully", data: result });
  } catch (error) {
    logger.error(`Get Method call failed with error: - ${error}`);
    res.status(500).json({ status: false, message: "An error occurred while getting results" });
  }
};

const GetByIdMethod = async (req: Request, res: Response) => {
    try {
      const { type } = req.body;
      logger.info(`Get  By Id start for type : ${type}`);
      const result = await getService.GetByIdMethod(req.body);
        logger.info(`Get  By Id Completed for type : ${type}`);
        res.status(200).json({ status: true, message: "Get successfully", data: result });
    } catch (error) {
      logger.error(`Get  By Id call failed with error: - ${error}`);
      res.status(500).json({ status: false, message: "An error occurred while getting results" });
    }
  };


export default {
  GetMethod,
  GetByIdMethod
};
