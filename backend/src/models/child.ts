// models/Child.ts
import { Model, Table, Column, DataType, ForeignKey, BelongsTo, HasMany } from 'sequelize-typescript';
import { Parent } from './parent';
import { Vaccine } from './vaccine';
import { VaccineTaken } from './vaccineTaken';

@Table({
  tableName: 'children',
  timestamps: false,
})
export class Child extends Model {
  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  name!: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  adahar!: string;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  gender!: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  dob!: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  img?: string;

  // Foreign key to the Parent model
  @ForeignKey(() => Parent)
  @Column
  parentId!: number;

  // Many-to-one relationship: Child belongs to a Parent
  @BelongsTo(() => Parent)
  parent!: Parent;

  // Many-to-many relationship setup for vaccinesToBeGiven and vaccinesTaken
  @HasMany(() => VaccineTaken)
  vaccinesTaken!: VaccineTaken[];
}
