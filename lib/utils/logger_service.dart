import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(),
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
