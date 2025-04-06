import { Inject, Injectable, NotFoundException } from '@nestjs/common';
import { Film } from './schemas/films.schema';
import { FilmsRepository } from '../repository/films.repository';

@Injectable()
export class FilmsService {
  constructor(private readonly filmsRepository: FilmsRepository) {}

  async getAll(): Promise<Film[]> {
    const films = await this.filmsRepository.findAll();
    console.log(films, 'films');
    return films.map((film) => ({
      id: film.id,
      rating: film.rating,
      director: film.director,
      tags: film.tags,
      title: film.title,
      description: film.description || film.about || '',
      image: `${film.image}`, // относительный путь для фронтенда
      cover: `${film.cover}`, // относительный путь для фронтенда
    }));
  }

  async findById(id: string): Promise<Film | null> {
    return this.filmsRepository.findById(id);
  }

  async getScheduleByFilmId(id: string) {
    const film = await this.findById(id);
    return film?.schedule ?? [];
  }
}
