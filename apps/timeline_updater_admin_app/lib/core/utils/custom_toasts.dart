import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// A custom class defining all custom success toasts
class CustomSuccessToasts extends TLSuccessToasts {

  /// For when the user signed in
  TLToast get userCreated => TLToast<CustomLocalizable>(ToastType.success, (CustomLocalizable translations) => translations.successToastUserCreated);
}

/// A custom class defining all custom info toasts
class CustomInfoToasts extends TLInfoToasts { }

/// A custom class defining all custom warning toasts
class CustomWarningToasts extends TLWarningToasts { }