import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { OrderDTO } from './dto/order.dto';
import { Film, FilmDocument } from '../films/schemas/films.schema';

@Injectable()
export class OrderService {
  constructor(
    @InjectModel(Film.name) private readonly filmModel: Model<FilmDocument>,
  ) {}

  async orderTickets(dto: OrderDTO) {
    const result = [];

    for (const ticket of dto.tickets) {
      const { film, session, row, seat } = ticket;
      const filmDoc = await this.filmModel.findOne({ id: film });

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
      });

      await this.filmModel.updateOne(
        { id: film },
        { $set: { schedule: filmDoc.schedule } },
      );
    }
    return result;
  }
}
