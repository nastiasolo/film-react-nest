import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { Document, Types } from 'mongoose';

@Schema()
export class Schedule {
  @Prop({ type: Types.ObjectId, ref: 'Film', required: true }) // Связь с фильмом
  filmId: Types.ObjectId;

  @Prop({ required: true })
  id: string; // Уникальный идентификатор расписания

  @Prop({ required: true })
  daytime: string; // Время сеанса

  @Prop({ required: true })
  hall: number;

  @Prop({ required: true })
  rows: number;

  @Prop({ required: true })
  seats: number;

  @Prop({ required: true })
  price: number;

  @Prop({ type: [String], default: [] }) // Массив занятых мест
  taken: string[];
}

export const ScheduleSchema = SchemaFactory.createForClass(Schedule);
