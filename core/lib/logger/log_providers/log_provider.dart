/// LogProvider
///
/// An interface to implement in order to write logs
abstract class LogProvider {
  /// log
  ///
  /// Override to implement logs writing
  void log({
    String? event,
    String? message,
    String? className,
    int? lineNumber,
    String? functionName,
  });
}
