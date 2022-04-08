class BffeServiceError extends Error {
  final String code;
  final String message;
  final Object? defaultError;

  BffeServiceError({
    required this.code,
    required this.message,
    this.defaultError,
  }) : super();
}
