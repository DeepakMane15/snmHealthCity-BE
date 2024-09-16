import express from "express";
import AuthController from "../../controllers/authController";
import authorize from "../../middlewares/authMiddleware";

const router = express.Router();

router.get("/signin", authorize, AuthController.fetchUnitById);

export default router;
