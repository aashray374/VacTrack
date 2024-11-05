// models/VaccineTaken.ts
import { Model, Table, Column, DataType, ForeignKey, BelongsTo } from 'sequelize-typescript';
import { Child } from './child';
import { Vaccine } from './vaccine';

@Table({
  tableName: 'vaccines_taken',
  timestamps: false,
})
export class VaccineTaken extends Model {
  @ForeignKey(() => Child)
  @Column
  childId!: number;

  @ForeignKey(() => Vaccine)
  @Column
  vaccineId!: number;

  @Column({
    type: DataType.DATEONLY,
    allowNull: false,
  })
  dateGiven!: string;

  @BelongsTo(() => Child)
  child!: Child;

  @BelongsTo(() => Vaccine)
  vaccine!: Vaccine;
}
