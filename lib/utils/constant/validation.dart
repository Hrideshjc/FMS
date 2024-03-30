import 'package:VMS/utils/constant/text_directory.dart';

String? validatePassword({required String string}) {
  if (string.isEmpty) {
    return "${UITextValidation.requiredValue}";
  } else if (string.length < 8) {
    return "${UITextValidation.mustBe8Password}";
  } else if (string.length > 15) {
    return "${UITextValidation.mustBe15Password}";
  } else {
    return null;
  }
}

String? confirmPassword({required String password, required String cPassword}) {
  if (password == cPassword) {
    return null;
  } else {
    return "${UITextValidation.matchPassword}";
  }
}

/// email validator
String? validateEmail({required String string}) {
  final emailRegex = RegExp(r'^[\w-\.]+@[\w-]');
  if (!emailRegex.hasMatch(string)) {
    return '${UITextValidation.invalidEmail}';
  }
  return null;
}

String? validatePhone({required String string}) {
  if (string.isEmpty) {
    return "${UITextValidation.requiredValue}";
  } else if (string.length < 6) {
    return "${UITextValidation.atLeastPhoneNumber}";
  } else if (string.length > 10) {
    return "${UITextValidation.greaterPhoneNumber}";
  } else {
    return null;
  }
}

/// validate min length
String? validateMinLength({required String string, required int length}) {
  return (string.length < length && string.isEmpty)
      ? "It must be greate than $length characters"
      : null;
}

/// validate max length
String? validateMaxLength({required String string, int length = 4}) {
  return string.length > length
      ? "It must not exceed $length characters"
      : null;
}

/// validate empty string
String? validateIsEmpty({required String string}) {
  return string.isEmpty ? "${UITextValidation.requiredValue}" : null;
}

String? validateNothing({required String string}) {
  return string.isEmpty ? null : null;
}

/// validate min-max length
String? validateMinMaxLength(
    {required String string, int minLegth = 1, int maxLength = 10}) {
  return (string.length < minLegth || string.length > maxLength)
      ? "It must be between $minLegth and $maxLength characters"
      : null;
}

/// validate min-max length with regex
String? validateMinMaxLengthWithRegex(
    {required String string,
    int minLegth = 1,
    int maxLength = 10,
    required String regex,
    String regexMessage = "Invalid data"}) {
  if (string.length < minLegth || string.length > maxLength) {
    return "It must be between $minLegth and $maxLength characters";
  } else if (!validRegexExp(regex, string)) {
    return regexMessage;
  } else {
    return null;
  }
}

/// validate regex for the string
bool validRegexExp(String regex, String string) {
  return RegExp(regex).hasMatch(string);
}
