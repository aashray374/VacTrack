import { log } from 'console';
import express, { Request, Response } from 'express';
import { Doctor } from '../models/doctor';
import { Appointment } from '../models/appointment';
import { AcceptedAppointment } from '../models/acceptedAppointMents';

export const makeAppointmentforDoctor = async (req: Request, res: Response) : Promise<void>=> {
      try {
            const { appointmentDate, patientName, time, patientContact, doctorId } = req.body;

            // Validate required fields
            if (!appointmentDate || !patientName || !time || !patientContact || !doctorId) {
                  res.status(400).json({ message: 'All fields are required' });
            }

            // Check if the doctor exists
            const doctor = await Doctor.findByPk(doctorId);
            if (!doctor) {
                   res.status(404).json({ message: 'Doctor not found' });
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


export const acceptAppointment = async (req: Request, res: Response): Promise<void> => {
      try {
          const { id } = req.body; // ID of the appointment to be accepted
  
          // Fetch the appointment
          const appointment = await Appointment.findByPk(id);
  
          if (!appointment) {
              res.status(404).json({ message: 'Appointment not found' });
              return;
          }
  
          // Create an accepted appointment
          const acceptedAppointment = await AcceptedAppointment.create({
              appointmentDate: appointment.appointmentDate,
              patientName: appointment.patientName,
              time: appointment.time,
              patientContact: appointment.patientContact,
              doctorId: appointment.doctorId,
          });
  
          // Remove the appointment from the appointments table
          await appointment.destroy();
  
          res.status(200).json({
              message: 'Appointment accepted successfully',
              acceptedAppointment,
          });
      } catch (error) {
          console.error('Error accepting appointment:', error);
          res.status(500).json({ message: 'Error accepting appointment', error });
      }
  };

  export const rejectAppointment = async (req: Request, res: Response): Promise<void> => {
      try {
          const { id } = req.body; // ID of the appointment to be rejected
  
          // Fetch the appointment
          const appointment = await Appointment.findByPk(id);
  
          if (!appointment) {
              res.status(404).json({ message: 'Appointment not found' });
              return;
          }
  
          // Remove the appointment from the appointments table
          await appointment.destroy();
  
          res.status(200).json({ message: 'Appointment rejected and removed successfully' });
      } catch (error) {
          console.error('Error rejecting appointment:', error);
          res.status(500).json({ message: 'Error rejecting appointment', error });
      }
  };
  

export const getAppointmentsForDoctor = async (req: Request, res: Response): Promise<void> => {
      try {
          const { doctorId } = req.body;
  
          // Check if the doctor exists
          const doctor = await Doctor.findByPk(doctorId);
          if (!doctor) {
              res.status(404).json({ message: 'Doctor not found' });
              return;
          }
  
          // Fetch all appointments for the doctor
          const appointments = await Appointment.findAll({
              where: { doctorId },
              order: [['appointmentDate', 'ASC'], ['time', 'ASC']], // Sort by date and time
          });
  
          if (appointments.length === 0) {
              res.status(404).json({ message: 'No appointments found for this doctor' });
              return;
          }
  
          res.status(200).json({
              message: 'Appointments fetched successfully',
              appointments,
          });
      } catch (error) {
          console.error('Error fetching appointments:', error);
          res.status(500).json({ message: 'Error fetching appointments', error });
      }
  };

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


