// src/models/Doctor.ts
import {
      Table,
      Column,
      Model,
      ForeignKey,
      DataType,
      BelongsTo,
    } from 'sequelize-typescript';
    import { Hospital } from './hospital';
    
    @Table({
      tableName: 'doctors',
      timestamps: true,
    })
    export class Doctor extends Model{
      @Column({
        type: DataType.STRING,
        allowNull: false,
      })
      name!: string;
    
      @Column({
        type: DataType.STRING,
        allowNull: false,
        unique: true,
      })
      email!: string;
    
      @Column({
        type: DataType.STRING,
        allowNull: false,
      })
      specialty!: string;

      @Column({
            type: DataType.STRING,
            allowNull: false
      })
      education!: string

      @Column({
            type: DataType.STRING,
            allowNull: false
      })
      contactNumber!: string
    
      @ForeignKey(() => Hospital)
      @Column({
        type: DataType.INTEGER,
        allowNull: false,
      })
      hospitalId!: number;
    
      @BelongsTo(() => Hospital)
      hospital!: Hospital;
    }
    