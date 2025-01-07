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
  Color get mainTopBarPath => TLColors.gray900;

  @override
  Color get profileButtonAvatarBackground => TLColors.gray200;

  @override
  Color get profileButtonAvatarIcon => TLColors.gray900;

  @override
  Color get profileButtonName => TLColors.gray900;

  @override
  Color get profileButtonPopoverBackground => TLColors.white;

  @override
  Color get signInTitle => TLColors.gray900;

  @override
  Color get signInSubtitle => TLColors.gray500;

  @override
  Color get createUserTitle => TLColors.gray900;

  @override
  Color get createUserSubtitle => TLColors.gray500;

  @override
  Color get usersDescription => TLColors.gray900;

  @override
  Color get customersDescription => TLColors.gray900;

  @override
  Color get customerDetailsDescription => TLColors.gray900;
}

/// Holds all dark colors
class CustomColorDataDark extends TLColorDataDark implements CustomColorable {

  /// Default constructor
  const CustomColorDataDark();

  @override
  Color get mainTopBarPath => TLColors.gray100;

  @override
  Color get profileButtonAvatarBackground => TLColors.gray800;

  @override
  Color get profileButtonAvatarIcon => TLColors.gray100;

  @override
  Color get profileButtonName => TLColors.gray100;

  @override
  Color get profileButtonPopoverBackground => TLColors.gray900;

  @override
  Color get signInTitle => TLColors.gray100;

  @override
  Color get signInSubtitle => TLColors.gray400;

  @override
  Color get createUserTitle => TLColors.gray100;

  @override
  Color get createUserSubtitle => TLColors.gray400;

  @override
  Color get usersDescription => TLColors.gray100;

  @override
  Color get customersDescription => TLColors.gray100;

  @override
  Color get customerDetailsDescription => TLColors.gray100;
}