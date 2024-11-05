// src/database.ts
import { Sequelize } from 'sequelize-typescript';
import { Parent } from '../models/parent';
import { Child } from '../models/child';
import { Vaccine } from '../models/vaccine';
import { VaccineTaken } from '../models/vaccineTaken';
import { log } from 'console';

const sequelize = new Sequelize({
  dialect: 'postgres',
  host: 'localhost',
  username: 'postgres',
  password: 'iiita123',
  database: 'VacTrack',
  logging: false,
  models: [Parent, Child, Vaccine, VaccineTaken], 
});
const connect = async()=>{
      try{
            await sequelize.sync();
            console.log('Database connected and synced');
      }catch(e){
            log(`Error ${e}`);
      }
}

export {
      sequelize,
      connect
};