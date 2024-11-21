import express from 'express';
import { signUpHospital, addDoctor, loginHospital, loginDoctor} from '../controllers/hospital';
import { getDoctorsByHospital } from '../controllers/doctor';
import { extractHospitalAndDoctor } from '../middlewares/hospital';
import { getAppointmentsForDoctor, makeAppointmentforDoctor, deleteAppointforDoctor} from '../controllers/appointment';

const router = express.Router();

// Define route to add hospital
router.post('/addHospital', signUpHospital);
router.post('/addDoctor', addDoctor);
router.post('/loginHospital', loginHospital);
router.post('/loginDoctor', loginDoctor);
router.get('/allDoctors', extractHospitalAndDoctor ,getDoctorsByHospital);

router.get('/getAppointments', extractHospitalAndDoctor, getAppointmentsForDoctor);
router.post('/createAppointment', makeAppointmentforDoctor);

export default router;
