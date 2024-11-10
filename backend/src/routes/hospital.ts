import express from 'express';
import { addHospital, addDoctor } from '../controllers/hospital';

const router = express.Router();

// Define route to add hospital
router.post('/addHospital', addHospital);
router.post('/addDoctor', addDoctor);

export default router;
