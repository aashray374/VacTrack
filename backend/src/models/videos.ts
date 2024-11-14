import {
      Table,
      Column,
      Model,
      DataType,
    } from 'sequelize-typescript';


    @Table({
      tableName: "videos",
    })
    export class Videos extends Model{

      @Column({
            type: DataType.STRING,
            allowNull: false,
      })
      url!: string;
    }