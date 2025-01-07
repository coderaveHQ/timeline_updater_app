import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `StandardFlavor`
extension StandardFlavorX on StandardFlavor {

  /// Gets the translated title of the standard flavor
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      StandardFlavor.enterprise => translations.standardFlavorEnterprise,
      StandardFlavor.plastics => translations.standardFlavorPlastics,
      StandardFlavor.neo => translations.standardFlavorNeo,
      StandardFlavor.components => translations.standardFlavorComponents,
      StandardFlavor.electronics => translations.standardFlavorElectronics,
      StandardFlavor.guss => translations.standardFlavorGuss
    };
  }

  /// Gets the typical color of each standard flavor
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      StandardFlavor.enterprise => colors.standardFlavorEnterprise,
      StandardFlavor.plastics => colors.standardFlavorPlastics,
      StandardFlavor.neo => colors.standardFlavorNeo,
      StandardFlavor.components => colors.standardFlavorComponents,
      StandardFlavor.electronics => colors.standardFlavorElectronics,
      StandardFlavor.guss => colors.standardFlavorGuss
    };
  }
}