import 'package:core/logger/log_providers/log_provider.dart';

/// ConsoleLogProvider
///
/// A log provider that writes on the console
class ConsoleLogProvider implements LogProvider {
  @override
  void log({
    String? event,
    String? message,
    String? className,
    String? functionName,
    int? lineNumber,
  }) {
    // ignore: avoid_print
    print("""
    $event: $message
    👉🏻 Class: $className
    👉🏻 Function: $functionName
    👉🏻 Line: $lineNumber
    """);
  }
}
