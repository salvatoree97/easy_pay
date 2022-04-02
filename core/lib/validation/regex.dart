class Regex {
  static final isPBValidRegex = RegExp("^[RPFrpf][0-9]{6}");

  static final isEmailRegex = RegExp(
    r"""^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@reply.it""",
  );

  static final isPasswordRegex = RegExp(
    r"""^(?=.*?[A-Z-a-z])(?=.*?[0-9]).{6,}$""",
  );

  static final isMinimum8Characters = RegExp(
    r"""^(?=.{8,}$)""",
  );
  static final isMaximum50Characters = RegExp(
    r"""^(?=.{0,50}$)""",
  );

  static final inputFormatEmail =
      RegExp("[A-Za-z0-9#!.@#\$%&':;,><*+/=?^_{|}~-]*");

  static final inputPhone = RegExp("[0-9#+ ]*");

  static final validPhone = RegExp("^(?:[+0]9)?[0-9]{10}\$");
}
