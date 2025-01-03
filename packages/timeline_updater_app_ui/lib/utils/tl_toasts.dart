import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/services/toaster.dart';

/// A class for toasts besides errors (`success`, `info`, `warning`)
class TLToasts {

  /// Holds all success toasts
  static TLSuccessToasts get success => TLSuccessToasts();

  /// Holds all info toasts
  static TLInfoToasts get info => TLInfoToasts();

  /// Holds all warning toasts
  static TLWarningToasts get warning => TLWarningToasts();
}

/// A class defining all success toasts
class TLSuccessToasts {

  /// For when the user signed in
  TLToast get signedIn => TLToast((TLLocalizable language) => language.successToastSignedIn);

  /// For when the user signed out
  TLToast get signedOut => TLToast((TLLocalizable language) => language.successToastSignedOut);
}

/// A class defining all info toasts
class TLInfoToasts { }

/// A class defining all warning toasts
class TLWarningToasts { }

/// A class defining the structure of a toast
class TLToast {
  
  /// A callback for the translation
  final String Function(TLLocalizable) message;

  /// Default constructor
  const TLToast(this.message);

  /// Shows a toast with the corresponding message
  void show(BuildContext context) {
    final TLLocalizable language = TLLocalization.languageOf(context);
    final String msg = message.call(language);
    Toaster.showError(context, msg);
  }
}