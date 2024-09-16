// src/routes/index.ts
import { Router } from 'express';
import authRoutes from './auth/authRoute';

const router = Router();

// Mount each route under a specific path
router.use('/auth', authRoutes);

export default router;
