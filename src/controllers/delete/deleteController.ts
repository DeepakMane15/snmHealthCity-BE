import { Request, Response } from "express";
import logger from "../../utils/winston";
import authService from "../../services/auth/authService";
var jwt = require("jsonwebtoken");
import crypto from "crypto";
import deleteService from "../../services/delete/deleteService";

const DeleteMethod = async (req: Request, res: Response) => {
  try {
    const { type,id } = req.body;
    let result:any = [];
    logger.info(`Delete Method start for type : ${type} and id : ${id}`);
    result = await deleteService.deleteMethod(req.body);
    logger.info(`Delete Method Completed for type : ${type} and id : ${id}`);
    res.status(200).json({ status: true, message: "Deleted successfully" });
  } catch (error) {
    logger.error(`Delete Method call failed with error: - ${error}`);
    res.status(500).json({ status: false, message: "An error occurred while deleting results" });
  }
};

export default {
    DeleteMethod
};
