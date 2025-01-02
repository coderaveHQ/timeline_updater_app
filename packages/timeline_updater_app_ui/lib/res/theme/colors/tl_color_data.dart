import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_colors.dart';

/// A class holding all localizable strings
abstract class TLColorable {

  /// The brightness of the keyboard
  Brightness get keyboardBrightness;

  /// The brightness of the status bar
  Brightness get statusBarBrightness;

  /// The brightness of the status bar icon
  Brightness get statusBarIconBrightness;

  /// The brightness of the system navigation bar icon
  Brightness get systemNavigationBarIconBrightness;

  /// The color of the status bar
  Color get statusBarColor;

  /// The color of the system navigation bar
  Color get systemNavigationBarColor;

  /// The color of the system navigation bar divider
  Color get systemNavigationBarDividerColor;
}

/// A class holding all colors per color theme
class TLColorData {

  /// light
  final TLColorDataLight light;

  /// dark
  final TLColorDataDark dark;

  /// Default constructor
  const TLColorData({
    required this.light,
    required this.dark
  });
}

/// Holds all light colors
class TLColorDataLight implements TLColorable {

  /// Default constructor
  const TLColorDataLight();
  
  @override
  Brightness get keyboardBrightness => Brightness.light;
  
  @override
  Brightness get statusBarBrightness => Brightness.light;

  @override
  Brightness get statusBarIconBrightness => Brightness.dark;

  @override
  Brightness get systemNavigationBarIconBrightness => Brightness.dark;
  
  @override
  Color get statusBarColor => TLColors.transparent;
  
  @override
  Color get systemNavigationBarColor => TLColors.white;
  
  @override
  Color get systemNavigationBarDividerColor => TLColors.white;
}

/// Holds all dark colors
class TLColorDataDark implements TLColorable {

  /// Default constructor
  const TLColorDataDark();
  
  @override
  Brightness get keyboardBrightness => Brightness.dark;
  
  @override
  Brightness get statusBarBrightness => Brightness.dark;

  @override
  Brightness get statusBarIconBrightness => Brightness.light;

  @override
  Brightness get systemNavigationBarIconBrightness => Brightness.light;
  
  @override
  Color get statusBarColor => TLColors.transparent;
  
  @override
  Color get systemNavigationBarColor => TLColors.gray900;
  
  @override
  Color get systemNavigationBarDividerColor => TLColors.gray900;
}