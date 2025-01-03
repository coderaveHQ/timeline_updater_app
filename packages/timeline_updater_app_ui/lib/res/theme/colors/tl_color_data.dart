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

  /// The primary background
  Color get primaryBackground;

  /// The background color of the app bar
  Color get appBarBackground;

  /// The app bar title foreground color
  Color get appBarTitle;

  /// The background color of the app bar button
  Color get appBarButtonBackground;

  /// The foreground color of the app bar button
  Color get appBarButtonForeground;

  /// The background color for a square button
  Color get squareButtonBackground;

  /// The foreground color for a square button
  Color get squareButtonForeground;

  /// The background color for a circular button
  Color get circularButtonBackground;

  /// The foreground color for a circular button
  Color get circularButtonForeground;

  /// The background color for a rectangle button
  Color get rectangleButtonBackground;

  /// The foreground color for a rectangle button
  Color get rectangleButtonForeground;

  /// The color for a circular progress indicator
  Color get circularProgressIndicator;

  /// The background color of the text field
  Color get textFieldBackground;

  /// The foreground color of the text field
  Color get textFieldForeground;

  /// The color of the text field hint
  Color get textFieldHint;

  /// The color of the cursor of the text field
  Color get textFieldCursor;

  /// The color of the icon of the text field
  Color get textFieldIcon;

  /// The color of the border of the text field when not active
  Color get textFieldInactiveBorder;

  /// The color of the border of the text field when active
  Color get textFieldActiveBorder;

  /// The color of the background of the toast
  Color get toastBackground;

  /// The color of the foreground of the toast
  Color get toastForeground;

  /// The color of the icon of a toast of type success
  Color get toastSuccessIcon;

  /// The color of the icon of a toast of type info
  Color get toastInfoIcon;

  /// The color of the icon of a toast of type warning
  Color get toastWarningIcon;

  /// The color of the icon of a toast of type error
  Color get toastErrorIcon;
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

  @override
  Color get primaryBackground => TLColors.white;

  @override
  Color get appBarBackground => TLColors.white;

  @override
  Color get appBarTitle => TLColors.gray900;

  @override
  Color get appBarButtonBackground => TLColors.white;

  @override
  Color get appBarButtonForeground => TLColors.gray900;

  @override
  Color get squareButtonBackground => TLColors.gray300;

  @override
  Color get squareButtonForeground => TLColors.gray900;

  @override
  Color get circularButtonBackground => TLColors.gray300;

  @override
  Color get circularButtonForeground => TLColors.gray900;

  @override
  Color get rectangleButtonBackground => TLColors.timeline;

  @override
  Color get rectangleButtonForeground => TLColors.white;

  @override
  Color get circularProgressIndicator => TLColors.gray900;

  @override
  Color get textFieldBackground => TLColors.gray200;

  @override
  Color get textFieldForeground => TLColors.gray900;

  @override
  Color get textFieldHint => TLColors.gray500;

  @override
  Color get textFieldCursor => TLColors.gray500;

  @override
  Color get textFieldIcon => TLColors.gray500;

  @override
  Color get textFieldInactiveBorder => TLColors.gray200;

  @override
  Color get textFieldActiveBorder => TLColors.timeline;

  @override
  Color get toastBackground => TLColors.white;

  @override
  Color get toastForeground => TLColors.gray900;

  @override
  Color get toastSuccessIcon => TLColors.green500;

  @override
  Color get toastInfoIcon => TLColors.blue500;

  @override
  Color get toastWarningIcon => TLColors.orange500;

  @override
  Color get toastErrorIcon => TLColors.red500;
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

  @override
  Color get primaryBackground => TLColors.gray900;

  @override
  Color get appBarBackground => TLColors.gray900;

  @override
  Color get appBarTitle => TLColors.gray100;

  @override
  Color get appBarButtonBackground => TLColors.gray900;

  @override
  Color get appBarButtonForeground => TLColors.gray100;

  @override
  Color get squareButtonBackground => TLColors.gray700;

  @override
  Color get squareButtonForeground => TLColors.gray100;

  @override
  Color get circularButtonBackground => TLColors.gray700;

  @override
  Color get circularButtonForeground => TLColors.gray100;

  @override
  Color get rectangleButtonBackground => TLColors.timeline;

  @override
  Color get rectangleButtonForeground => TLColors.white;

  @override
  Color get circularProgressIndicator => TLColors.gray100;

  @override
  Color get textFieldBackground => TLColors.gray800;

  @override
  Color get textFieldForeground => TLColors.gray100;

  @override
  Color get textFieldHint => TLColors.gray400;

  @override
  Color get textFieldCursor => TLColors.gray400;

  @override
  Color get textFieldIcon => TLColors.gray400;

  @override
  Color get textFieldInactiveBorder => TLColors.gray800;

  @override
  Color get textFieldActiveBorder => TLColors.timeline;

  @override
  Color get toastBackground => TLColors.gray900;

  @override
  Color get toastForeground => TLColors.gray100;

  @override
  Color get toastSuccessIcon => TLColors.green600;

  @override
  Color get toastInfoIcon => TLColors.blue600;

  @override
  Color get toastWarningIcon => TLColors.orange600;

  @override
  Color get toastErrorIcon => TLColors.red600;
}