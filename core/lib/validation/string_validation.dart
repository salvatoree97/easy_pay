import 'package:core/core.dart';

class IsFilled implements ValidationRule<String> {
  @override
  String errorMessage;

  IsFilled({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return value.trim().isNotEmpty;
  }
}

class IsEmail implements ValidationRule<String> {
  @override
  String errorMessage;

  IsEmail({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Regex.isEmailRegex.hasMatch(value);
  }
}

class IsPassword implements ValidationRule<String> {
  @override
  String errorMessage;

  IsPassword({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Regex.isPasswordRegex.hasMatch(value);
  }
}

class IsMinimum8Chars implements ValidationRule<String> {
  @override
  String errorMessage;

  IsMinimum8Chars({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Regex.isMinimum8Characters.hasMatch(value);
  }
}

class IsMaximum50Chars implements ValidationRule<String> {
  @override
  String errorMessage;

  IsMaximum50Chars({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Regex.isMaximum50Characters.hasMatch(value);
  }
}

class IsDifferent implements ValidationRule<String> {
  @override
  String errorMessage;
  String lastValue;

  IsDifferent({required this.errorMessage, required this.lastValue});

  @override
  bool isValid({required String value}) {
    return value != lastValue;
  }
}

class IsValidPhone implements ValidationRule<String> {
  @override
  String errorMessage;

  IsValidPhone({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Regex.validPhone.hasMatch(value);
  }
}

class IsUserUnderage implements ValidationRule<String> {
  @override
  String errorMessage;

  IsUserUnderage({required this.errorMessage});

  @override
  bool isValid({required String value}) {
    if (value.isEmpty) {
      return true;
    }
    try {
      final dateFormat = DateFormat("dd/MM/yyyy");
      final today = DateTime.now();
      final selectedDate = dateFormat.parse(value);

      int age = today.year - selectedDate.year;
      if (selectedDate.month > today.month) {
        age--;
      } else if (today.month == selectedDate.month) {
        if (selectedDate.day > today.day) {
          age--;
        }
      }
      return age >= 18;
    } catch (_) {
      return false;
    }
  }
}

class IsEqual implements ValidationRule<String> {
  @override
  String errorMessage;
  String? lastValue;

  IsEqual({required this.errorMessage, required this.lastValue});

  @override
  bool isValid({required String value}) {
    return value == lastValue;
  }
}

class IsDateAfter implements ValidationRule<String> {
  @override
  String errorMessage;
  DateTime? dateTime;

  IsDateAfter({required this.errorMessage, this.dateTime});

  @override
  bool isValid({required String value}) {
    return dateTime != null && value.parseDateTime().isDateAfter(dateTime!);
  }
}

class IsDateBefore implements ValidationRule<String> {
  @override
  String errorMessage;
  DateTime? dateTime;

  IsDateBefore({required this.errorMessage, this.dateTime});

  @override
  bool isValid({required String value}) {
    return dateTime != null && value.parseDateTime().isDateBefore(dateTime!);
  }
}

class IsCustomValidationRule implements ValidationRule<String> {
  @override
  String errorMessage = "";
  Function customFunction;

  IsCustomValidationRule(
      {required this.customFunction, required this.errorMessage});

  @override
  bool isValid({required String value}) {
    return Function.apply(customFunction, []) as bool;
  }
}
