// src/routes/index.ts
import { Router } from 'express';
import authRoutes from './auth/authRoute';
import getRoutes from './get/getRoutes';
import getByIdRoutes from './getById/getByIdRoutes';
import saveRoutes from './save/saveRoutes';
import editRoutes from './edit/editRoutes';


const router = Router();

// Mount each route under a specific path
router.get('/', (req,res) => {
    res.send({status:200, message:"Listening"});
})
router.use('/auth', authRoutes);
router.use('/snm-get', getRoutes);
router.use('/snm-get-by-id', getByIdRoutes);
router.use('/snm-save', saveRoutes);
router.use('/snm-edit', editRoutes);


export default router;
