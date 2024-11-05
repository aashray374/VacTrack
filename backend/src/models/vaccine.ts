// models/Vaccine.ts
import { Model, Table, Column, DataType } from 'sequelize-typescript';

@Table({
  tableName: 'vaccines',
  timestamps: false,
})
export class Vaccine extends Model {
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  name!: string;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  usage!: string;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  days!: number;
}
