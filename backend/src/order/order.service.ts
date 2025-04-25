import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Film } from '../entities/film.entity';
import { OrderDTO } from './dto/order.dto';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Film)
    private readonly filmRepository: Repository<Film>,
  ) {}

  async orderTickets(dto: OrderDTO) {
    const result = [];

    for (const ticket of dto.tickets) {
      const { film, session, row, seat } = ticket;
      const filmDoc = await this.filmRepository.findOne({
        where: { id: film },
        relations: ['schedule'],
      });

      if (!filmDoc) {
        throw new BadRequestException(`Фильм с id ${film} не найден`);
      }

      const schedule = filmDoc.schedule?.find((s) => s.id === session);
      if (!schedule) {
        throw new BadRequestException(`Сеанс с id ${session} не найден`);
      }

      const place = `${row}:${seat}`;

      if (schedule.taken?.includes(place)) {
        throw new BadRequestException(`Место ${place} уже занято`);
      }

      schedule.taken = schedule.taken || [];
      schedule.taken.push(place);

      result.push({
        film,
        session,
        row,
        seat,
        daytime: schedule.daytime,
        price: schedule.price,
      });

      await this.filmRepository.save(filmDoc);
    }

    return result;
  }
}
