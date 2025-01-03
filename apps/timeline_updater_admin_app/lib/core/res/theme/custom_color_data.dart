import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';

/// A custom class holding all colors per color theme
class CustomColorData implements TLColorData {

  @override
  TLColorDataLight get light => const CustomColorDataLight();

  @override
  TLColorDataDark get dark => const CustomColorDataDark();

  /// Default constructor
  const CustomColorData();
}

/// Holds all light colors
class CustomColorDataLight extends TLColorDataLight implements CustomColorable {

  /// Default constructor
  const CustomColorDataLight();

  @override
  Color get signInTitle => TLColors.gray900;

  @override
  Color get signInSubtitle => TLColors.gray500;
}

/// Holds all dark colors
class CustomColorDataDark extends TLColorDataDark implements CustomColorable {

  /// Default constructor
  const CustomColorDataDark();

  @override
  Color get signInTitle => TLColors.gray100;

  @override
  Color get signInSubtitle => TLColors.gray400;
}