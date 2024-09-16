import { Request, Response } from "express";
import logger from "../../utils/winston";
import saveService from "../../services/save/saveService";
import editService from "../../services/edit/editService";

const editMethod = async (req: Request, res: Response) => {
  try {
    const { type } = req.body;
    logger.info(`Edit Method start for type : ${type}`);
    const result = await editService.editMethod(req.body);
    logger.info(`Edit Method Completed for type : ${type}`);
    res.status(200).json({ status: true, message: "Get successfully", data: result });
  } catch (error) {
    logger.error(`Edit Method call failed with error: - ${error}`);
    res.status(500).json({ status: false, message: "An error occurred while getting results" });
  }
};

export default {
    editMethod,
};
