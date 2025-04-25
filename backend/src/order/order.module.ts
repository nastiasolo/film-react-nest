import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Film } from '../entities/film.entity';
import { FilmsModule } from '../films/films.module';
import { OrderController } from './order.controller';
import { OrderService } from './order.service';

@Module({
  imports: [TypeOrmModule.forFeature([Film]), FilmsModule],
  controllers: [OrderController],
  providers: [OrderService],
})
export class OrderModule {}
