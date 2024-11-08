import express from "express";
import authorize from "../../middlewares/authMiddleware";
import getController from "../../controllers/get/getController";

const router = express.Router();

router.post("/device-info", authorize, getController.GetDeviceData);
router.get("/prtg-list", authorize, getController.PrtgList);
router.post("/save-coordinates", authorize, getController.SaveCoordinates);


export default router;
