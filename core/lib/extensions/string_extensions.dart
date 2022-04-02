extension StringExtension on String {
  String replaceAllWhiteSpaces() {
    // This pattern means "at least one space, or more"
    // \\s : space
    // +   : one or more
    final pattern = RegExp('\\s+');
    return replaceAll(pattern, '');
  }

  String formatPriceWithCurrency() {
    return this + "€";
  }

  String withoutPrefix() {
    return replaceAll(RegExp('\\+39'), '');
  }

  String addItalianPrefix() {
    return '+39' + this;
  }
}

extension StringListExtension on List<String> {
  String joinToString(
      {required String defaultDelimeter, String? lastDelimiter}) {
    String result = "";
    if (isNotEmpty) {
      result += this[0];
      for (int i = 1; i < length; i++) {
        if (i == length - 1) {
          result += ((lastDelimiter ?? defaultDelimeter) + this[i]);
        } else {
          result += (defaultDelimeter + this[i]);
        }
      }
    }
    return result;
  }
}
