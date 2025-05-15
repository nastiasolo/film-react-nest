import { JsonLogger } from './json.logger';

describe('JsonLogger', () => {
  let logger: JsonLogger;

  beforeEach(() => {
    logger = new JsonLogger();
    jest.clearAllMocks();
  });

  it('should log a message using console.log with correct format', () => {
    const spy = jest.spyOn(console, 'log').mockImplementation(() => {});
    logger.log('hello', 'world');

    expect(spy).toHaveBeenCalledTimes(1);
    const logged = spy.mock.calls[0][0];
    const parsed = JSON.parse(logged);

    expect(parsed.level).toBe('log');
    expect(parsed.message).toBe('hello');
    expect(parsed.optionalParams).toEqual(['world']);
    expect(parsed.timestamp).toBeDefined();
  });

  it('should log a warning using console.warn', () => {
    const spy = jest.spyOn(console, 'warn').mockImplementation(() => {});
    logger.warn('warn message', 42);

    const logged = spy.mock.calls[0][0];
    const parsed = JSON.parse(logged);

    expect(parsed.level).toBe('warn');
    expect(parsed.message).toBe('warn message');
    expect(parsed.optionalParams).toEqual([42]);
  });

  it('should log an error using console.error with trace', () => {
    const spy = jest.spyOn(console, 'error').mockImplementation(() => {});
    logger.error('error occurred', 'trace info', 'more details');

    const logged = spy.mock.calls[0][0];
    const parsed = JSON.parse(logged);

    expect(parsed.level).toBe('error');
    expect(parsed.message).toBe('error occurred');
    expect(parsed.optionalParams).toEqual(['trace info', 'more details']);
  });

  it('should log debug and verbose messages', () => {
    const debugSpy = jest.spyOn(console, 'debug').mockImplementation(() => {});
    const infoSpy = jest.spyOn(console, 'info').mockImplementation(() => {});

    logger.debug('debug info');
    logger.verbose('verbose info', { extra: true });

    const debugLog = JSON.parse(debugSpy.mock.calls[0][0]);
    const verboseLog = JSON.parse(infoSpy.mock.calls[0][0]);

    expect(debugLog.level).toBe('debug');
    expect(verboseLog.level).toBe('verbose');
    expect(verboseLog.optionalParams[0]).toEqual({ extra: true });
  });
});
