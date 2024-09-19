import express from "express";
import authorize from "../../middlewares/authMiddleware";
import deleteController from "../../controllers/delete/deleteController";

const router = express.Router();

router.post("/", authorize, deleteController.DeleteMethod);

export default router;
