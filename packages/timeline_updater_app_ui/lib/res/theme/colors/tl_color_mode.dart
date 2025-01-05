import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An enum specifying the available color modes
enum TLColorMode {

  /// The color mode system
  system(
    id: null
  ),
  /// The color mode light
  light(
    id: 1
  ),
  /// The color mode dark
  dark(
    id: 2
  );

  /// The id of the color mode
  final int? id;

  /// Default constructor
  const TLColorMode({
    this.id
  });

  /// Gets the color mode by the id
  static TLColorMode getColorModeById(int? id) {
    return TLColorMode.values.firstWhere((TLColorMode mode) => mode.id == id);
  }

  /// Gets the translated title of the enum value
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    return switch (this) {
      TLColorMode.system => translations.colorModeSystemTitle,
      TLColorMode.light => translations.colorModeLightTitle,
      TLColorMode.dark => translations.colorModeDarkTitle
    };
  }
}