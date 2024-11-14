const express = require('express');
import { Request, Response } from 'express';
const { Vaccine } = require('../models'); 


export const getAllVaccines = async (req: Request, res: Response): Promise<void> => {
      try {
            const vaccines = await Vaccine.findAll();
            res.json(vaccines);
      } catch (error) {
            console.error('Error fetching vaccines:', error);
            res.status(500).json({ error: 'Internal server error' });
      }
}

