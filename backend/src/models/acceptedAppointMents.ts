// src/models/Appointment.ts
import {
      Table,
      Column,
      Model,
      ForeignKey,
      DataType,
      BelongsTo,
      AllowNull,
    } from 'sequelize-typescript';
    import { Doctor } from './doctor';
    
    @Table({
      tableName: 'appointments_accepted',
      timestamps: true,
    })
    export class AcceptedAppointment extends Model {
      @Column({
        type: DataType.STRING,
        allowNull: false,
      })
      appointmentDate!: string;
    
      @Column({
        type: DataType.STRING,
        allowNull: false,
      })
      patientName!: string;

      @Column({
            type: DataType.STRING,
            allowNull: false 
      })
      time!: string
    
      @Column({
        type: DataType.STRING,
        allowNull: false,
      })
      patientContact!: string;

      @ForeignKey(() => Doctor)
      @Column({
        type: DataType.INTEGER,
        allowNull: false,
      })
      doctorId!: number;
    
      @BelongsTo(() => Doctor)
      doctor!: Doctor;
    }
    