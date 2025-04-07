import { IsString, IsArray, IsNumber, IsOptional } from 'class-validator';
import { Film } from '../schemas/films.schema';

export class ScheduleDTO {
  @IsString()
  id: string; // Идентификатор сеанса

  @IsString()
  daytime: string; // Время сеанса

  @IsNumber()
  hall: number; // Номер зала

  @IsNumber()
  rows: number; // Количество рядов в зале

  @IsNumber()
  seats: number; // Количество мест в ряду

  @IsNumber()
  price: number; // Цена билета

  @IsArray()
  taken: string[]; // Список забронированных мест (может быть массивом строк)
}

export class FilmDTO {
  @IsString()
  id: string;

  @IsNumber()
  rating: number;

  @IsString()
  director: string;

  @IsArray()
  tags: string[];

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

  // Конструктор для инициализации из Film
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
    this.schedule = film.schedule; // если schedule есть
  }
}
