import { Injectable } from '@nestjs/common';
import { Film } from './schemas/films.schema';
import { FilmsRepository } from '../repository/films.repository';

@Injectable()
export class FilmsService {
  constructor(private readonly filmsRepository: FilmsRepository) {}

  async getAll(): Promise<Film[]> {
    const films = await this.filmsRepository.findAll();

    return films.map((film) => ({
      id: film.id,
      rating: film.rating,
      director: film.director,
      tags: film.tags,
      title: film.title,
      description: film.description || film.about || '',
      image: `${film.image}`,
      cover: `${film.cover}`,
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
