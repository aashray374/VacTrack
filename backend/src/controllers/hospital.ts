import { log } from 'console';
import { Request, Response } from 'express';
import { Hospital } from '../models/hospital';
import { Doctor } from '../models/doctor';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';


const JWT_SECRET = "VacTrack";

export const signUpHospital = async (req: Request, res: Response): Promise<void> => {
      const { name, email, location, lat, long, contactNumber, password }: {
            name: string;
            email: string;
            location: string;
            lat: number;
            long: number;
            contactNumber: string;
            password: string;
      } = req.body;

      try {
            // Check if the hospital already exists
            const existingHospital = await Hospital.findOne({ where: { location } });
            if (existingHospital) {
                  res.status(409).json({ msg: 'Hospital already registered at this location' });
                  return;
            }

            // Hash the password
            const hashedPassword = await bcrypt.hash(password, 10);

            // Create a new hospital
            const hospital = await Hospital.create({
                  name,
                  email,
                  location,
                  lat,
                  long,
                  contactNumber,
                  password: hashedPassword,
            });

            // Generate JWT
            const token = jwt.sign({ id: hospital.id, location: hospital.location }, JWT_SECRET, {
                  expiresIn: '1d',
            });

            // Send response with token in headers
            res.status(200).json({
                  msg: 'Hospital registered successfully',
                  token: token,
                  hospital: hospital,
            });
      } catch (error) {
            console.error(error);
            res.status(500).json({ msg: 'Internal server error', error });
      }
};


export const loginHospital = async (req: Request, res: Response): Promise<void> => {
      log(req.body);
      const { email, password }: { email: string; password: string } = req.body;

      try {
            // Find hospital by location
            const hospital = await Hospital.findOne({ where: { email } });
            if (!hospital) {
                  res.status(404).json({ msg: 'Hospital not found' });
                  return;
            }


            // Compare passwords
            const isMatch = await bcrypt.compare(password, hospital.password);
            if (!isMatch) {
                  res.status(401).json({ msg: 'Invalid credentials' });
                  return;
            }

            // Generate JWT
            const token = jwt.sign({ id: hospital.id, location: hospital.location }, JWT_SECRET, {
                  expiresIn: '1d',
            });

            // Send response with token in headers
            res.status(200).json({
                  msg: 'Login successful',
                  token: token,
                  hospital: {
                        id: hospital.id,
                        name: hospital.name,
                        location: hospital.location,
                  },
            });
      } catch (error) {
            console.error(error);
            res.status(500).json({ msg: 'Internal server error', error });
      }
};





// Add a new Doctor to a Hospital
export const addDoctor = async (req: Request, res: Response): Promise<void> => {
      try {
          const { hospitalId, name, email, specialty, contactNumber, education, password } = req.body;
  
          // Find the hospital by ID
          const hospital = await Hospital.findByPk(hospitalId);
          if (!hospital) {
              res.status(404).json({ message: 'Hospital not found' });
              return;
          }
  
          // Hash the password
          const hashedPassword = await bcrypt.hash(password, 10);
  
          // Create the doctor
          const doctor = await Doctor.create({
              name,
              email,
              password: hashedPassword, // Correct field name
              specialty,
              education,
              contactNumber,
              hospitalId,
          });
  
          // Generate a JWT token
          const token = jwt.sign({ id: doctor.id, email: doctor.email }, JWT_SECRET, {
              expiresIn: '1d',
          });
  
          res.status(200).json({
              msg: 'Doctor registered successfully',
              token: token,
              doctor: doctor,
          });
      } catch (error) {
          console.error('Error adding doctor:', error);
          res.status(500).json({ message: 'Server error while adding doctor', error });
      }
  };
  
export const loginDoctor = async (req: Request, res: Response): Promise<void> => {
      const { email, password }: { email: string; password: string; } = req.body;
      try {
            const doctor = await Doctor.findOne({ where: { email } });
            if (!doctor) {
                  res.status(404).json({ msg: 'doctor not found' });
                  return;
            }

            const isMatch = await bcrypt.compare(password, doctor.password);
            if (!isMatch) {
                  res.status(401).json({ msg: 'Invalid credentials' });
                  return;
            }

            const token = jwt.sign({ id: doctor.id, email: doctor.email }, JWT_SECRET, {
                  expiresIn: '1d',
            });

            // Send response with token in headers
            res.status(200).json({
                  msg: 'Login successful',
                  token: token,
                  doctor: doctor
            });

      } catch (error) {
            console.error('Error adding doctor:', error);
            res.status(500).json({ message: 'Server error while adding doctor' });
      }
}

export const getHospitalById = async (req: Request, res: Response): Promise<void> => {
      try {
            const { id } = req.body;

            const hospital = await Hospital.findByPk(id);

            if (!hospital) {
                  res.status(404).json({ message: 'Hospital not found' });
                  return;
            }

            res.status(200).json({
                  message: 'hospital fetched perfectly',
                  hospital: hospital
            })


      } catch (error) {
            console.error('Error adding doctor:', error);
            res.status(500).json({ message: 'Server error while adding doctor' });
      }
}


export const deleteDoctor = async (req: Request, res: Response): Promise<void> => {
      try {
            const { hospitalId, doctorId }: { hospitalId: number, doctorId: number } = req.body;

            const hospital = await Hospital.findByPk(hospitalId);

            if (!hospital) {
                  res.status(404).json({ message: 'Hospital not found' });
                  return;
            } else {
                  const doctor = await Doctor.findByPk(doctorId);

                  if (!doctor) {
                        res.status(404).json({ message: 'doctor not found' });
                        return;
                  } else {

                        await doctor.destroy;

                        res.status(200).json({
                              message: 'doctor deleted successfully'
                        });
                  }
            }
      } catch (error) {
            console.error('Error adding doctor:', error);
            res.status(500).json({ message: 'Server error while deleteing doctor' });
      }
}


export const getHospitals = async (req: Request, res: Response): Promise<void> => {
      try {
            const hospitals = await Hospital.findAll();

            if (hospitals.length === 0) {
                  res.status(404).json({ message: 'No hospitals found' });
                  return;
            }

            res.status(200).json({
                  message: 'Hospitals fetched successfully',
                  hospitals,
            });
      } catch (error) {
            console.error('Error fetching hospitals:', error);
            res.status(500).json({ message: 'Server error while fetching hospitals' });
      }
};



