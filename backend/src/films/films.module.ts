import { Module } from '@nestjs/common';

import { FilmsController } from './films.controller';
import { FilmsService } from './films.service';

import { FilmsRepository } from '../repository/films.repository';

import { TypeOrmModule } from '@nestjs/typeorm';
import { Schedule } from '../entities/schedule.entity';
import { Film } from '../entities/film.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Film, Schedule])],
  controllers: [FilmsController],
  providers: [FilmsService, FilmsRepository],
})
export class FilmsModule {}
