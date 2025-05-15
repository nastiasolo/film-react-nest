import { Injectable } from '@nestjs/common';
import { ILogger } from './logger.interface';

@Injectable()
export class TskvLogger implements ILogger {
  private format(
    level: string,
    message: string,
    context?: string,
    trace?: string,
  ) {
    return `tskv\ttimestamp=${new Date().toISOString()}\tlevel=${level}\tmessage=${message}\tcontext=${context ?? ''}\ttrace=${trace ?? ''}`;
  }

  log(message: string, context?: string) {
    console.log(this.format('log', message, context));
  }

  error(message: string, trace?: string, context?: string) {
    console.error(this.format('error', message, context, trace));
  }

  warn(message: string, context?: string) {
    console.warn(this.format('warn', message, context));
  }
}
