import 'package:logger/logger.dart';

class LoggerService {
  static final _logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 0,
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 70,
      colors: true,
      printEmojis: false,
      printTime: true,
    ),
  );


  static void log(String message) {
    _logger.d(message);
  }

  static void error(String message) {
    _logger.e(message);
  }

  static void info(String message) {
    _logger.i(message);
  }
}
