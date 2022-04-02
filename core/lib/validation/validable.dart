import 'package:core/validation/validation_rule.dart';

mixin Validable<T> {
  List<ValidationRule<T>> get validationRules;

  String? validate(T value) {
    try {
      return validationRules
          .firstWhere((element) => !element.isValid(value: value))
          .errorMessage;
    } catch (_) {
      return null;
    }
  }
}
