import { Body, Controller, Post } from '@nestjs/common';
import { CreateOrderDto } from './dto/order.dto';

@Controller('order')
export class OrderController {
  @Post('/')
  createOrder(@Body() orderData: CreateOrderDto) {
    return { message: 'Заказ создан', data: orderData };
  }
}
