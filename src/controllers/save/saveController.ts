import { Request, Response } from "express";
import logger from "../../utils/winston";
import saveService from "../../services/save/saveService";

const SaveMethod = async (req: Request, res: Response) => {
  try {
    const { type } = req.body;
    logger.info(`Save Method start for type : ${type}`);
    const result = await saveService.saveMethod(req.body);
    logger.info(`Save Method Completed for type : ${type}`);
    res.status(200).json({ status: true, message: "Get successfully", data: result });
  } catch (error) {
    logger.error(`Save Method call failed with error: - ${error}`);
    res.status(500).json({ status: false, message: "An error occurred while getting results" });
  }
};

export default {
    SaveMethod,
};
