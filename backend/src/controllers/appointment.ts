import { log } from 'console';
import express, { Request, Response } from 'express';
import { Doctor } from '../models/doctor';
import { Appointment } from '../models/appointment';

export const makeAppointmentforDoctor = async (req: Request, res: Response) => {
      try {
            const { appointmentDate, patientName, time, patientContact, doctorId } = req.body;

            // Validate required fields
            if (!appointmentDate || !patientName || !time || !patientContact || !doctorId) {
                  return res.status(400).json({ message: 'All fields are required' });
            }

            // Check if the doctor exists
            const doctor = await Doctor.findByPk(doctorId);
            if (!doctor) {
                  return res.status(404).json({ message: 'Doctor not found' });
            }

            // Create the appointment
            
            const appointment = await Appointment.create({
                  appointmentDate,
                  patientName,
                  time,
                  patientContact,
                  doctorId,
            });

            res.status(201).json(appointment);
      } catch (error) {
            res.status(500).json({ message: 'Error creating appointment', error });
      }
}


export const deleteAppointforDoctor = async (req: Request, res: Response): Promise<void> => {
      try {
            const { id } = req.params;

            // Find and delete the appointment
            const appointment = await Appointment.findByPk(id);
            if (!appointment) {
                  res.status(404).json({ message: 'Appointment not found' });
            } else {

                  await appointment.destroy();
            }

            res.status(200).json({ message: 'Appointment deleted successfully' });
      } catch (error) {
            res.status(500).json({ message: 'Error deleting appointment', error });
      }
}


