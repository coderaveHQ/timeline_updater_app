import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';

/// A custom class defining all custom success toasts
class CustomSuccessToasts extends TLSuccessToasts {

  /// For when a standard was uploaded
  TLToast get standardUploaded => TLToast<CustomLocalizable>(ToastType.success, (CustomLocalizable translations) => translations.successToastStandardUploaded);
}

/// A custom class defining all custom info toasts
class CustomInfoToasts extends TLInfoToasts { }

/// A custom class defining all custom warning toasts
class CustomWarningToasts extends TLWarningToasts { }