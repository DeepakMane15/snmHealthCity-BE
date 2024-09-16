import express from "express";
import authorize from "../../middlewares/authMiddleware";
import saveController from "../../controllers/save/saveController";

const router = express.Router();

router.post("/", authorize, saveController.SaveMethod);

export default router;
