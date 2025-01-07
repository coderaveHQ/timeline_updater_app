import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `StandardEvolution`
extension StandardEvolutionX on StandardEvolution {

  /// Gets the translated title of the standard evolution
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      StandardEvolution.e3 => translations.standardEvolutionE3
    };
  }

  /// Gets the typical color of each standard evolution
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      StandardEvolution.e3 => colors.standardEvolutionE3
    };
  }
}