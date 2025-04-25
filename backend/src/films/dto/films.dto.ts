import { IsString, IsArray, IsNumber, IsOptional } from 'class-validator';
import { Film } from '../../entities/film.entity';

export class ScheduleDTO {
  @IsString()
  id: string;

  @IsString()
  daytime: string;

  @IsNumber()
  hall: number;

  @IsNumber()
  rows: number;

  @IsNumber()
  seats: number;

  @IsNumber()
  price: number;

  @IsArray()
  taken: string[];
}

export class FilmDTO {
  @IsString()
  id: string;

  @IsNumber()
  rating: number;

  @IsString()
  director: string;

  @IsString()
  tags: string;

  @IsString()
  image: string;

  @IsString()
  cover: string;

  @IsString()
  title: string;

  @IsString()
  about: string;

  @IsString()
  description: string;

  @IsArray()
  @IsOptional()
  schedule?: ScheduleDTO[];

  constructor(film: Film) {
    this.id = film.id;
    this.rating = film.rating;
    this.director = film.director;
    this.tags = film.tags;
    this.image = film.image;
    this.cover = film.cover;
    this.title = film.title;
    this.about = film.about;
    this.description = film.description;
    if (film.schedule) {
      this.schedule = film.schedule.map((s) => ({
        id: s.id,
        daytime:
          s.daytime instanceof Date ? s.daytime.toISOString() : s.daytime,
        hall: s.hall,
        rows: s.rows,
        seats: s.seats,
        price: s.price,
        taken: s.taken || [],
      }));
    }
  }
}
