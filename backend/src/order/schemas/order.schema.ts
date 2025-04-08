import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type OrderDocument = Order & Document;

@Schema({ timestamps: true })
export class Order {
  @Prop({ required: true })
  filmId: string;

  @Prop({ required: true })
  scheduleId: string;

  @Prop({ type: [String], required: true })
  seats: string[];
}

export const OrderSchema = SchemaFactory.createForClass(Order);
