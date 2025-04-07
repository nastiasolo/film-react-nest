import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { FilmsService } from './films.service';

@Controller('films')
export class FilmsController {
  constructor(private readonly filmsService: FilmsService) {}

  @Get()
  async getAll() {
    const films = await this.filmsService.getAll();
    return { items: films };
  }

  @Get(':id/schedule')
  async getScheduleByFilmId(@Param('id') id: string) {
    const film = await this.filmsService.findById(id);
    if (!film) {
      throw new NotFoundException('Фильм не найден');
    }

    return { items: film.schedule ?? [] };
  }
}
