/// LogEvent
///
/// A class that describes the types of logs that can be handled
class LogEvent {
  final String value;
  final int level;

  const LogEvent(this.value, this.level);

  static LogEvent debug = const LogEvent("🔎 Debug", 0);
  static LogEvent error = const LogEvent("💀 Error", 1);
  static LogEvent warning = const LogEvent("⚠️ Warning", 2);
  static LogEvent info = const LogEvent("🍏 Info", 3);

  @override
  String toString() {
    return value;
  }
}
