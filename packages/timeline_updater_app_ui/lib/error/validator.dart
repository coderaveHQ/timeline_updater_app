import 'package:timeline_updater_app_ui/error/validation_error.dart';

/// A custom validator
class Validator {

  /// Validates an email
  static void validateEmail(String email) {
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email)) throw ValidationError.invalidEmail();
  }

  /// Validates a password
  static void validatePassword(String password) {
    if (password.length < 6 || password.length > 128) throw ValidationError.invalidPassword();
  }
}