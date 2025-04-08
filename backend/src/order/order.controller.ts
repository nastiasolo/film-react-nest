import { Controller, Post, Body, HttpCode } from '@nestjs/common';
import { OrderService } from './order.service';
import { OrderDTO } from './dto/order.dto';
import dayjs from 'dayjs';

@Controller('order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Post()
  @HttpCode(200)
  async orderTickets(@Body() dto: OrderDTO) {
    const rawTickets = await this.orderService.orderTickets(dto);

    // превращаем каждый билет в ScheduleSession
    const sessions = rawTickets.map((ticket) => {
      const date = dayjs(ticket.daytime);
      return {
        id: ticket.session,
        day: date.format('D MMMM'),
        time: date.format('HH:mm'),
      };
    });

    return {
      total: sessions.length,
      items: sessions,
    };
  }
}
