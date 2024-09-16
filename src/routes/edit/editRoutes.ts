import express from "express";
import authorize from "../../middlewares/authMiddleware";
import saveController from "../../controllers/save/saveController";
import editController from "../../controllers/edit/editController";

const router = express.Router();

router.post("/", authorize, editController.editMethod);

export default router;
