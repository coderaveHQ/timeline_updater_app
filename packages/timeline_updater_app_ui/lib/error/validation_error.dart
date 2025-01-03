import 'package:timeline_updater_app_ui/error/i_error.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';

/// A class holding possible validation errors
class ValidationError extends IError {

  /// An error for when an email seems to be invalid
  ValidationError.invalidEmail() 
    : super((TLLocalizable language) => language.validationErrorInvalidEmail);

  /// An error for when a password seems to be invalid
  ValidationError.invalidPassword()
    : super((TLLocalizable language) => language.validationErrorInvalidPassword);
}