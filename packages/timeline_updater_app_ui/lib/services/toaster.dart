import 'package:flutter/material.dart';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// The type of toast
enum ToastType {

  /// Success
  success(
    icon: LucideIcons.check
  ),
  /// Info
  info(
    icon: LucideIcons.info
  ),
  /// Warning
  warning(
    icon: LucideIcons.triangleAlert
  ),
  /// Error
  error(
    icon: LucideIcons.x
  );

  /// The icon
  final IconData icon;

  /// Default constructor
  const ToastType({
    required this.icon
  });

  /// Gets the color of the icon
  Color iconColor(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      ToastType.success => colors.toastSuccessIcon,
      ToastType.info => colors.toastInfoIcon,
      ToastType.warning => colors.toastWarningIcon,
      ToastType.error => colors.toastErrorIcon
    };
  }
}

/// A class for showing different types of toasts
class Toaster {

  /// Shows a success toast
  static void showSuccess(BuildContext context, String text) {
    _show(context, ToastType.success, text);
  }

  /// Shows an info toast
  static void showInfo(BuildContext context, String text) {
    _show(context, ToastType.info, text);
  }

  /// Shows a warning toast
  static void showWarning(BuildContext context, String text) {
    _show(context, ToastType.warning, text);
  }

  /// Shows an error toast
  static void showError(BuildContext context, String text) {
    _show(context, ToastType.error, text);
  }

  /// Shows a toast
  static void _show(BuildContext context, ToastType type, String text) {
    DelightToastBar(
      autoDismiss: true,
      builder: (BuildContext context) => _build(context, type, text)
    ).show(context);
  }

  /// Builds a toast
  static ToastCard _build(BuildContext context, ToastType type, String text) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return ToastCard(
      color: colors.toastBackground,
      leading: Icon(
        type.icon,
        size: 28.0,
        color: type.iconColor(context)
      ),
      title: TLText(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          color: colors.toastForeground
        )
      )
    );
  }
}