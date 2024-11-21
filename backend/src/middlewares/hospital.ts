import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

const JWT_SECRET = "VacTrack";

interface JwtPayload {
    id?: number;
    email?: string;
    location?: string;
}

export const extractHospitalAndDoctor = (req: Request, res: Response, next: NextFunction): void => {
    try {
      const token = req.header('Authorization'); // Extract token from "Authorization" header

        if (!token) {
            res.status(401).json({ message: 'Authentication token missing' });
            return;
        }

        const decoded = jwt.verify(token, JWT_SECRET) as JwtPayload;

        if (decoded.id) {
            req.body.hospitalId = decoded.id;
        }

        if (decoded.email) {
            req.body.doctorId = decoded.id; // Assuming the email identifies the doctor
        }

        next();
    } catch (error) {
        console.error('Error verifying JWT:', error);
        res.status(401).json({ message: 'Invalid or expired token' });
    }
};
