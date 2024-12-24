import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_colors.dart';

/// A class specifying the color data used for different
class TLColorData {

  /// The brightness of the system navigation bar icon
  final Brightness systemNavigationBarIconBrightness;
  /// The brightness of the status bar
  final Brightness statusBarBrightness;
  /// The brightness of the status bar icon
  final Brightness statusBarIconBrightness;
  /// The brightness of the keyboard
  final Brightness keyboardBrightness;
  /// The color of the status bar
  final Color statusBarColor;
  /// The color of the system navigation bar
  final Color systemNavigationBarColor;
  /// The color of the system navigation bar divider
  final Color systemNavigationBarDividerColor;

  /// Default constructor
  const TLColorData({
    required this.systemNavigationBarIconBrightness,
    required this.statusBarBrightness,
    required this.statusBarIconBrightness,
    required this.keyboardBrightness,
    required this.statusBarColor,
    required this.systemNavigationBarColor,
    required this.systemNavigationBarDividerColor
  });

  /// Creates an instance of the color data for the light color mode
  factory TLColorData.light() => const TLColorData(
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    keyboardBrightness: Brightness.light,
    statusBarColor: TLColors.transparent,
    systemNavigationBarColor: TLColors.white,
    systemNavigationBarDividerColor: TLColors.white
  );

  /// Creates an instance of the color data for the dark color mode
  factory TLColorData.dark() => const TLColorData(
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    keyboardBrightness: Brightness.dark,
    statusBarColor: TLColors.transparent,
    systemNavigationBarColor: TLColors.gray900,
    systemNavigationBarDividerColor: TLColors.gray900
  );
}