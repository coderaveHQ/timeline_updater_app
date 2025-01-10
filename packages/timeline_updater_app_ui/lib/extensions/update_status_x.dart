import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `UpdateStatus`
extension UpdateStatusX on UpdateStatus {

  /// Gets the translated title of the update status
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      UpdateStatus.upcoming => translations.updateStatusUpcoming,
      UpdateStatus.ongoing => translations.updateStatusOngoing,
      UpdateStatus.success => translations.updateStatusSuccess,
      UpdateStatus.warning => translations.updateStatusWarning,
      UpdateStatus.error => translations.updateStatusError
    };
  }

  /// Gets the typical color of each update status
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      UpdateStatus.upcoming => colors.updateStatusUpcoming,
      UpdateStatus.ongoing => colors.updateStatusOngoing,
      UpdateStatus.success => colors.updateStatusSuccess,
      UpdateStatus.warning => colors.updateStatusWarning,
      UpdateStatus.error => colors.updateStatusError
    };
  }
}