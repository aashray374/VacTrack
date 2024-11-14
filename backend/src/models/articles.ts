import {
      Table,
      Column,
      Model,
      DataType,
    } from 'sequelize-typescript';


    @Table({
      tableName: "articles",
    })
    export class Articles extends Model{

      @Column({
            type: DataType.STRING,
            allowNull: false,
      })
      title!: string;
      
      @Column({
            type: DataType.STRING,
            allowNull: false,
      })
      img!: string;


      @Column({
            type: DataType.STRING,
            allowNull: false,
      })
      url!: string;
    }