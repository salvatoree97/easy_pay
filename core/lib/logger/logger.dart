import 'package:core/logger/log_event.dart';
import 'package:core/logger/log_providers/log_provider.dart';
import 'package:stack_trace/stack_trace.dart';

/// Logger
class Logger {
  static final Logger instance = Logger._();

  final Set<LogProvider> _providers = {};
  LogEvent logLevel = LogEvent.debug;

  Logger._();

  /// Registers the [LogProvider] to enable it to write logs
  void register({required LogProvider provider}) {
    _providers.add(provider);
  }

  /// debug
  ///
  /// Writes a debug type log
  void debug(
    dynamic object, {
    String? className,
    String? functionName,
    int? lineNumber,
  }) {
    if (logLevel.level > LogEvent.debug.level) {
      return;
    }

    _providers.forEach((provider) {
      provider.log(
        event: LogEvent.debug.toString(),
        message: object.toString(),
        className: className ?? Trace.current().frames[3].member,
        functionName:
            functionName ?? Trace?.current().frames[2].member?.split(".")[1],
        lineNumber: lineNumber ?? Trace.current().frames[3].line,
      );
    });
  }

  /// error
  ///
  /// Writes a error type log
  void error(
    dynamic object, {
    String? className,
    String? functionName,
    int? lineNumber,
  }) {
    if (logLevel.level > LogEvent.error.level) {
      return;
    }

    _providers.forEach((provider) {
      provider.log(
        event: LogEvent.error.toString(),
        message: object.toString(),
        className: className ?? Trace.current().frames[3].member,
        functionName:
            functionName ?? Trace?.current().frames[2].member?.split(".")[1],
        lineNumber: lineNumber ?? Trace.current().frames[3].line,
      );
    });
  }

  /// warning
  ///
  /// Writes a warning type log
  void warning(
    dynamic object, {
    String? className,
    String? functionName,
    int? lineNumber,
  }) {
    if (logLevel.level > LogEvent.warning.level) {
      return;
    }

    _providers.forEach((provider) {
      provider.log(
        event: LogEvent.warning.toString(),
        message: object.toString(),
        className: className ?? Trace.current().frames[3].member,
        functionName:
            functionName ?? Trace?.current().frames[2].member?.split(".")[1],
        lineNumber: lineNumber ?? Trace.current().frames[3].line,
      );
    });
  }

  /// info
  ///
  /// Writes a info type log
  void info(
    dynamic object, {
    String? className,
    String? functionName,
    int? lineNumber,
  }) {
    if (logLevel.level > LogEvent.info.level) {
      return;
    }

    _providers.forEach((provider) {
      provider.log(
        event: LogEvent.info.toString(),
        message: object.toString(),
        className: className ?? Trace.current().frames[3].member,
        functionName:
            functionName ?? Trace?.current().frames[2].member?.split(".")[1],
        lineNumber: lineNumber ?? Trace.current().frames[3].line,
      );
    });
  }
}
