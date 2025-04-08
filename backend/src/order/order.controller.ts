import { Controller, Post, Body, HttpCode } from '@nestjs/common';
import { OrderService } from './order.service';
import { OrderDTO } from './dto/order.dto';

@Controller('order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Post()
  @HttpCode(200)
  async orderTickets(@Body() dto: OrderDTO) {
    const items = await this.orderService.orderTickets(dto);

    return {
      total: items.length,
      items,
    };
  }
}
