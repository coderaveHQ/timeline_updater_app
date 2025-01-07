import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `StandardVersion`
extension StandardVersionX on StandardVersion {

  /// Gets the translated title of the standard version
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      StandardVersion.v15 => translations.standardVersionV15,
      StandardVersion.v15_5 => translations.standardVersionV15_5,
      StandardVersion.v16 => translations.standardVersionV16
    };
  }

  /// Gets the typical color of each standard version
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      StandardVersion.v15 => colors.standardVersionV15,
      StandardVersion.v15_5 => colors.standardVersionV15_5,
      StandardVersion.v16 => colors.standardVersionV16
    };
  }
}