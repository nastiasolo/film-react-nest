import { TskvLogger } from './tskv.logger';

describe('TskvLogger', () => {
  let logger: TskvLogger;

  beforeEach(() => {
    logger = new TskvLogger();
    jest.spyOn(console, 'log').mockImplementation(() => {});
    jest.spyOn(console, 'warn').mockImplementation(() => {});
    jest.spyOn(console, 'error').mockImplementation(() => {});
  });

  afterEach(() => {
    jest.restoreAllMocks();
  });

  it('should log message in TSKV format', () => {
    const message = 'User logged in';
    const context = 'AuthService';

    logger.log(message, context);

    expect(console.log).toHaveBeenCalledWith(expect.stringContaining('tskv'));
    expect(console.log).toHaveBeenCalledWith(
      expect.stringContaining(`message=${message}`),
    );
    expect(console.log).toHaveBeenCalledWith(
      expect.stringContaining(`context=${context}`),
    );
  });

  it('should log error with trace in TSKV format', () => {
    const message = 'Unexpected error';
    const trace = 'stack trace';
    const context = 'PaymentService';

    logger.error(message, trace, context);

    expect(console.error).toHaveBeenCalledWith(
      expect.stringContaining(`level=error`),
    );
    expect(console.error).toHaveBeenCalledWith(
      expect.stringContaining(`trace=${trace}`),
    );
  });

  it('should handle object messages by stringifying them manually', () => {
    const obj = { user: 'admin' };
    const context = 'AdminService';

    logger.log(JSON.stringify(obj), context);

    expect(console.log).toHaveBeenCalledWith(
      expect.stringContaining(`message={"user":"admin"}`),
    );
  });
});
