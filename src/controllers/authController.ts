import { Request, Response } from "express";
import UnitsMasterService from "../services/authService";
import logger from "../utils/winston";
import {
  GetUnitsMasterResultModel,
  UnitsMasterDataModel,
} from "../models/unitsMasterDataModel";
import { SortType, UnitMasterSortBy } from "../common/AppEnum";


const fetchUnitById = async (req: Request, res: Response) => {
  try {
    // const { id } = req.params;
    // logger.info(`Fetching Unit record by id IN for id: ${id}`);
    // const unit = await UnitsMasterService.getUnitById(parseInt(id, 10));
    // if (unit) {
    //   logger.info(`Fetching Unit record by id OUT for id: ${id}`);
      res
        .status(200)
        .json({ message: "Hello World", });
    // } else {
    //   logger.warn(`Unit record does not exist for id: ${id}`);
    //   res.status(404).json({ message: "Unit not found" });
    // }
  } catch (error) {
    logger.error(`Error fetching Unit record by id: - ${error}`);
    res
      .status(500)
      .json({ error: "An error occurred while fetching the unit" });
  }
};

export default {
  fetchUnitById
};
