//TODO реализовать DTO для /orders
import { IsString, IsArray, IsNumber } from 'class-validator';

export class CreateOrderDto {
  @IsString()
  userId: string;

  @IsArray()
  @IsString({ each: true })
  tickets: string[];

  @IsNumber()
  totalPrice: number;
}
