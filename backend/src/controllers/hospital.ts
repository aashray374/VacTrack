import { log } from 'console';
import { Request, Response } from 'express';
import { Hospital } from '../models/hospital';
import { Doctor } from '../models/doctor';

export const addHospital = async (req: Request, res: Response): Promise<void> => {
      const { name, location, lat, long, contactNumber }: { name: string; location: string; lat: number; long: number; contactNumber: string } = req.body;

      try {
            const hospital = await Hospital.create({
                  name,
                  location,
                  lat,
                  long,
                  contactNumber,
            });

            // Return a success response with the created hospital
            res.status(201).json({
                  msg: 'Hospital added successfully',
                  hospital,  // You might want to return the hospital object here
            });
      } catch (error) {
            log(error);
            res.status(500).json({
                  msg: 'Internal server error',
                  err: error,
            });
      }
};


// Add a new Doctor to a Hospital
export const addDoctor = async (req: Request, res: Response): Promise<void> => {
      try {
            const { hospitalId, name, email,specialty, contactNumber,education } = req.body;

            // Find the hospital by ID
            const hospital = await Hospital.findByPk(hospitalId);
            if (!hospital) {
                  res.status(404).json({ message: 'Hospital not found' });
                  return;
            }

            const doctor = await Doctor.create({
                  name,
                  email,
                  specialty,
                  contactNumber,
                  hospitalId,
            });

            res.status(201).json(doctor);
      } catch (error) {
            console.error('Error adding doctor:', error);
            res.status(500).json({ message: 'Server error while adding doctor' });
      }
};
