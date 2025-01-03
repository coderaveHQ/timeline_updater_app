import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/error/i_error.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/services/toaster.dart';

/// An extension class for Object
extension ObjectExtension on Object {

  /// Gets the message of the error
  String _errorMessage(BuildContext context) {
    final TLLocalizable language = TLLocalization.languageOf(context);
    if (this is IError) return (this as IError).message.call(language);
    return language.unknownErrorMessage;
  }

  /// Shows a toast with a proper message
  void showErrorToast(BuildContext context) {
    final String errorMessage = _errorMessage(context);
    Toaster.showError(context, errorMessage);
  }
}