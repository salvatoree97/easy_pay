abstract class ValidationRule<T> {
  late String errorMessage;
  bool isValid({required T value});
}
