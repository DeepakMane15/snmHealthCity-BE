import express from "express";
import authorize from "../../middlewares/authMiddleware";
import getController from "../../controllers/get/getController";

const router = express.Router();

router.post("/", authorize, getController.GetMethod);

router.post("/device-info", authorize, getController.GetDeviceData);


export default router;
