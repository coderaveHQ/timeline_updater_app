import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `StandardType`
extension StandardTypeX on StandardType {

  /// Gets the translated title of the standard type
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      StandardType.server => translations.standardTypeServer,
      StandardType.client => translations.standardTypeClient
    };
  }

  /// Gets the typical color of each standard version
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      StandardType.server => colors.standardTypeServer,
      StandardType.client => colors.standardTypeClient
    };
  }
}