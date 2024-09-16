import express from "express";
import authorize from "../../middlewares/authMiddleware";
import getController from "../../controllers/get/getController";

const router = express.Router();

router.post("/", authorize, getController.GetByIdMethod);

export default router;
