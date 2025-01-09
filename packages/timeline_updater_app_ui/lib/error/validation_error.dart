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

  /// An error for when a name seems to be invalid
  ValidationError.invalidName()
    : super((TLLocalizable language) => language.validationErrorInvalidName);

  /// An error for when a service key seems to be invalid
  ValidationError.invalidServiceKey()
    : super((TLLocalizable language) => language.validationErrorInvalidServiceKey);

  /// An error for when no standard file was selected
  ValidationError.noStandardFileSelected() // TODO Outsource to custom app project (TLU)
    : super((TLLocalizable language) => language.validationErrorNoStandardFileSelected);
    
  /// An error for when a selected standard file has a not supported file extension
  ValidationError.invalidStandardFileExtension()
    : super((TLLocalizable language) => language.validationErrorInvalidStandardFileExtension);
}