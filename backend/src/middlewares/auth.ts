import { log } from 'console';
import { Request, Response, NextFunction } from 'express';
import jwt, { JwtPayload } from 'jsonwebtoken';

export const auth = (req: Request, res: Response, next: NextFunction): void => {
  const token = req.header('Authorization');

  if (!token) {
    res.status(401).json({ msg: 'No token, authorization denied' });
    return;
  }

  try {
    jwt.verify(token, "VacTrack", (err, decoded) => {
      if (err) {
            log(err);
        return res.status(401).json({ msg: 'Token not valid' });
      }

      // Check that the decoded token contains the 'parent' field
      const decodedPayload = decoded as JwtPayload;
      if (decodedPayload.parent) {
        req.body.parent = decodedPayload.parent; // Set `req.parent` with decoded parent data
        next(); // Proceed to the next middleware
      } else {
        console.error('Token structure is invalid.');
        res.status(401).json({ msg: 'Token structure is invalid' });
      }
    });
  } catch (error) {
    console.error('Error in authentication middleware:', error);
    res.status(500).json({ msg: 'Server error' });
  }
};
