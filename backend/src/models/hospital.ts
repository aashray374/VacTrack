import {
      Table,
      Column,
      Model,
      DataType,
      HasMany,
      PrimaryKey,
      AutoIncrement,
  } from 'sequelize-typescript';
  import { Doctor } from './doctor';
  
  @Table({
      tableName: 'hospitals',
      timestamps: true,
  })
  export class Hospital extends Model {
      @PrimaryKey
      @AutoIncrement
      @Column({
          type: DataType.INTEGER,
      })
      id!: number;
  
      @Column({
          type: DataType.STRING,
          allowNull: false,
      })
      name!: string;

      @Column({
            type: DataType.STRING,
            allowNull: false,
        })
        email!: string;

        @Column({
            type: DataType.STRING,
            allowNull: false,
        })
        password!: string;
  
      @Column({
          type: DataType.STRING,
          allowNull: false,
          unique: true,
      })
      location!: string;
  
      @Column({
          type: DataType.DOUBLE,
          allowNull: false,
      })
      lat!: number;
  
      @Column({
          type: DataType.DOUBLE,
          allowNull: false,
      })
      long!: number;
  
      @Column({
          type: DataType.STRING,
          allowNull: true,
      })
      contactNumber!: string;
  
      @HasMany(() => Doctor)
      doctors!: Doctor[];
  }
  