import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class CLog {
  static CLog simple = CLog();
  static CLog pretty = CLog(methodCount: 2, shouldPrintTimestamp: true);

  static final CLog _singleton = CLog._internal();

  Logger? _log;

  factory CLog({int methodCount = 0, int errorMethodCount = 10, int lineLength= 150, bool shouldPrintTimestamp = false}) {
    final printer = PrettyPrinter(
        methodCount: methodCount, // number of method calls to be displayed
        errorMethodCount: errorMethodCount, // number of method calls if stacktrace is provided
        lineLength: lineLength, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: shouldPrintTimestamp // Should each log print contain a timestamp
    );

    _singleton._log = new Logger(filter: _isDebugMode() ? DevelopmentFilter() : null, printer: printer);

    return _singleton;
  }

  CLog._internal();

  logInfo(String msg) {
    _log?.log(Level.info, msg);
  }

  logWarning(String msg) {
    _log?.log(Level.warning, msg);
  }

  logFailures(String msg, {required Object error, required StackTrace stackTrace}) {
    _log?.log(Level.error, msg, error, stackTrace);
  }

  static bool _isDebugMode() => kReleaseMode == false;
}
