import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';
import { Schedule, ScheduleSchema } from './schedule.schema';

export type FilmDocument = Film & Document;

@Schema()
export class Film {
  @Prop({ required: true })
  id: string;

  @Prop()
  rating: number;

  @Prop()
  director: string;

  @Prop([String])
  tags: string[];

  @Prop()
  image: string;

  @Prop()
  cover: string;

  @Prop()
  title: string;

  @Prop()
  about?: string;

  @Prop()
  description: string;

  @Prop({ type: [ScheduleSchema] })
  schedule?: Schedule[];
}

export const FilmSchema = SchemaFactory.createForClass(Film);
