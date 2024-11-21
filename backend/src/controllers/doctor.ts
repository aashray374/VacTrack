import { log } from 'console';
import { Request, Response } from 'express';
import { Hospital } from '../models/hospital';
import { Doctor } from '../models/doctor';


export const getDoctorsByHospital = async (req: Request, res: Response): Promise<void> => {
      try {
          const { hospitalId }: { hospitalId: number } = req.body;
  
          // Find the hospital by ID
          const hospital = await Hospital.findByPk(hospitalId);
  
          if (!hospital) {
              res.status(404).json({ message: 'Hospital not found' });
              return;
          }
  
          // Fetch all doctors associated with the hospital
          const doctors = await Doctor.findAll({ where: { hospitalId } });
  
          if (doctors.length === 0) {
              res.status(404).json({ message: 'No doctors found for this hospital' });
              return;
          }
  
          res.status(200).json({
              message: 'Doctors fetched successfully',
              doctors,
          });
      } catch (error) {
          console.error('Error fetching doctors:', error);
          res.status(500).json({ message: 'Server error while fetching doctors' });
      }
}