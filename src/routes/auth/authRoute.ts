import express from "express";
import AuthController from "../../controllers/authController";
import authorize from "../../middlewares/authMiddleware";

const router = express.Router();

router.post("/signin", authorize, AuthController.signin);

export default router;
