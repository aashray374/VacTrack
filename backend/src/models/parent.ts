// models/Parent.ts
import { Model, Table, Column, DataType, HasMany, AllowNull, BeforeCreate } from 'sequelize-typescript';
import { Child } from './child';
import bcrypt from 'bcrypt';


@Table({
  tableName: 'parents',
  timestamps: false, // Change to true if you need createdAt/updatedAt
})
export class Parent extends Model {
  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  name?: string;

  @Column({
    type: DataType.STRING,
    unique: true,
    allowNull: false,
  })
  email!: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  adahar?: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  location?: string;

  @Column({
      type: DataType.STRING,
      allowNull: false,
  })
  password!: string; 


  @HasMany(() => Child)
  children!: Child[];

  @BeforeCreate
  static async hashPassword(parent: Parent){
      parent.password = await bcrypt.hash(parent.password,10);
  }
}
