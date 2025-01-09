import 'dart:io';

import 'package:timeline_updater_app_ui/error/validation_error.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

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

  /// Validates a users name
  static void validateName(String name) {
    if (name.length < 2 || name.length > 64) throw ValidationError.invalidName();
  }

  /// Validates a service key
  static void validateServiceKey(String serviceKey) {
    if (serviceKey.isEmpty) throw ValidationError.invalidServiceKey();
  }

  /// Validates a standard file
  static void validateStandardFile(File? file) {
    if (file == null) throw ValidationError.noStandardFileSelected();
    if (!<String>[ 'exe', 'msi', 'msix' ].contains(file.fileExtension)) throw ValidationError.invalidStandardFileExtension();
  }
}