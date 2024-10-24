import express from "express";
import AuthController from "../../controllers/auth/authController";
import authorize from "../../middlewares/authMiddleware";

const router = express.Router();

router.post("/signin", AuthController.signin);

export default router;
