import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { Film } from './film.entity';

@Entity('schedules')
export class Schedule {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  daytime: Date;

  @Column('int')
  hall: number;

  @Column('int')
  price: number;

  @Column('int')
  rows: number;

  @Column('int')
  seats: number;

  @Column('simple-array', { default: '' })
  taken: string[];

  @ManyToOne(() => Film, (film) => film.schedule)
  @JoinColumn({ name: 'filmId' })
  film: Film;

  @Column()
  filmId: string;
}
