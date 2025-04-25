import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Film } from '../entities/film.entity';

import { FilmDTO } from './dto/films.dto';

@Injectable()
export class FilmsService {
  constructor(
    @InjectRepository(Film)
    private readonly filmsRepository: Repository<Film>,
  ) {}

  async getAll(): Promise<
    {
      id: string;
      rating: number;
      director: string;
      tags: string;
      title: string;
      description: string;
      image: string;
      cover: string;
    }[]
  > {
    const films = await this.filmsRepository.find({
      relations: ['schedule'],
    });

    return films.map((film) => new FilmDTO(film));
  }

  async findById(id: string): Promise<Film | null> {
    return this.filmsRepository.findOne({
      where: { id },
      relations: ['schedule'],
    });
  }

  async getScheduleByFilmId(id: string) {
    const film = await this.findById(id);
    return film?.schedule ?? [];
  }
}
