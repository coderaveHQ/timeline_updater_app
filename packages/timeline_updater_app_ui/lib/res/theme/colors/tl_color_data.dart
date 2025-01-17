import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_colors.dart';

/// A class holding all localizable strings
abstract class TLColorable {

  /// The color of the admin user type
  Color get userTypeAdmin;

  /// The color of the employee user type
  Color get userTypeEmployee;

  /// The color of the customer user type
  Color get userTypeCustomer;

  /// The color of the standard type server
  Color get standardTypeServer;

  /// The color of the standard type client
  Color get standardTypeClient;

  /// The color of the standard evolution e3
  Color get standardEvolutionE3;

  /// The color of the standard version v15
  Color get standardVersionV15;

  /// The color of the standard version v15.5
  Color get standardVersionV15_5;

  /// The color of the standard version v16
  Color get standardVersionV16;

  /// The color of the standard flavor enterprise
  Color get standardFlavorEnterprise;

  /// The color of the standard flavor plastics
  Color get standardFlavorPlastics;

  /// The color of the standard flavor neo
  Color get standardFlavorNeo;

  /// The color of the standard flavor components
  Color get standardFlavorComponents;

  /// The color of the standard flavor electronics
  Color get standardFlavorElectronics;

  /// The color of the standard flavor guss
  Color get standardFlavorGuss;

  /// The color of the updatet status upcoming
  Color get updateStatusUpcoming;
  
  /// The color of the updatet status ongoing
  Color get updateStatusOngoing;

  /// The color of the updatet status success
  Color get updateStatusSuccess;

  /// The color of the updatet status warning
  Color get updateStatusWarning;

  /// The color of the updatet status error
  Color get updateStatusError;

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

  /// The secondary background
  Color get secondaryBackground;

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

  /// The color of the navigation rails app name
  Color get navigationRailAppNameForeground;

  /// The color of the navigation rails app version
  Color get navigationRailAppVersionForeground;

  /// The leading icon color of a selected navigation rail item
  Color get navigationRailItemSelectedLeadingIcon;

  /// The leading icon color of an unselected navigation rail item
  Color get navigationRailItemUnselectedLeadingIcon;

  /// The trailing icon color of a selected navigation rail item
  Color get navigationRailItemSelectedTrailingIcon;

  /// The trailing icon color of an unselected navigation rail item
  Color get navigationRailItemUnselectedTrailingIcon;

  /// The background color of a selected navigation rail item
  Color get navigationRailItemSelectedBackground;

  /// The color of the title of a selected navigation rail item
  Color get navigationRailItemSelectedTitleForeground;

  /// The color of the title of an unselected navigation rail item
  Color get navigationRailItemUnselectedTitleForeground;

  /// The color of the icon of an icon button
  Color get iconButtonForeground;

  /// The color of the icon of a critical icon button
  Color get iconButtonCriticalForeground;

  /// The color of the table title
  Color get tableTitle;

  /// The color of the empty text in a table
  Color get tableEmptyText;

  /// The color of the error text in a table
  Color get tableErrorText;

  /// The background color of the table button
  Color get tableButtonBackground;

  /// The foreground color of the table button
  Color get tableButtonForeground;

  /// The color of the reload icon button in a table
  Color get tableReloadIcon;

  /// The background color of the table header
  Color get tableHeaderBackground;

  /// The color of the header titles
  Color get tableHeaderTitleForeground;

  /// The color of the text in a text cell
  Color get tableCellText;

  /// The color of the icon in a text cell
  Color get tableCellIcon;

  /// The background color of a chip
  Color get chipBackgroundColor;

  /// The color of the text on a chip
  Color get chipForegroundColor;

  /// The color of the border of a selected radio button
  Color get radioButtonSelectedBorder;

  /// The color of the border of an unselected radio button
  Color get radioButtonUnselectedBorder;

  /// The color of the indicator inside of a radio button
  Color get radioButtonIndicator;

  /// The color of the title of a selected radio button
  Color get radioButtonSelectedTitleForeground;

  /// The color of the title of an unselected radio button
  Color get radioButtonUnselectedTitleForeground;

  /// The background color of the TabBar
  Color get tabBarBackground;

  /// The background color of a selected TabBarItem
  Color get tabBarSelectedBackground;

  /// The color of the title of a selected TabBarItem
  Color get tabBarSelectedForeground;

  /// The color of the title of an unselected TabBarItem
  Color get tabBarUnselectedForeground;

  /// The background color of the dialog
  Color get dialogBackground;

  /// The color of the border around the leading icon of a dialog
  Color get dialogLeadingIconBorder;

  /// The color of the leading icon of a dialog
  Color get dialogLeadingIcon;

  /// The color of the dialogs title
  Color get dialogTitle;

  /// The color of the dialogs description
  Color get dialogDescription;

  /// The background color of a primary dialog button
  Color get dialogPrimaryButtonBackground;

  /// The foreground color of a primary dialog button
  Color get dialogPrimaryButtonForeground;

  /// The background color of a secondary dialog button
  Color get dialogSecondaryButtonBackground;

  /// The foreground color of a secondary dialog button
  Color get dialogSecondaryButtonForeground;

  /// The separator color
  Color get separator;

  /// The color of the drop zone border
  Color get dropZoneBorder;

  /// The background color of the drop zone when not hovering over
  Color get dropZoneBackground;

  /// The background color of the drop zone when hovering over
  Color get dropZoneHoveringBackground;

  /// The color of the clickable text in a drop zone
  Color get dropZoneClickableTextForeground;

  /// The color of the other text in a drop zone
  Color get dropZoneOtherTextForeground;

  /// The foreground color of the text button
  Color get textButtonForeground;

  /// The background color of the datetime picker
  Color get dateTimePickerBackground;

  /// The color of the text of the datetime picker
  Color get dateTimePickerText;

  /// The active color of the datetime picker
  Color get dateTimePickerActiveColor;

  /// The active text color of the datetime picker
  Color get dateTimePickerActiveTextColor;

  /// The foreground color of the datetime picker
  Color get dateTimePickerForeground;

  /// The background color of the datetime picker field
  Color get dateTimePickerFieldBackground;

  /// The icon color of the datetime picker field
  Color get dateTimePickerFieldIcon;

  /// The foreground color of the datetime picker field when empty
  Color get dateTimePickerFieldEmptyTextForeground;

  /// The foreground color of the datetime picker field
  Color get dateTimePickerFieldForeground;

  /// Settings page description
  Color get settingsDescription;

  /// The color of the title of a settings section
  Color get settingsSectionTitle;

  /// The color of the description of a settings section
  Color get settingsSectionDescription;

  /// The color of the title of a settings section item
  Color get settingsSectionItemTitle;
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
  Color get userTypeAdmin => TLColors.green500;

  @override
  Color get userTypeEmployee => TLColors.orange500;

  @override
  Color get userTypeCustomer => TLColors.purple500;

  @override
  Color get standardTypeServer => TLColors.blue500;

  @override
  Color get standardTypeClient => TLColors.purple500;

  @override
  Color get standardEvolutionE3 => TLColors.green500;

  @override
  Color get standardVersionV15 => TLColors.blue500;

  @override
  Color get standardVersionV15_5 => TLColors.purple500;

  @override
  Color get standardVersionV16 => TLColors.orange500;

  @override
  Color get standardFlavorEnterprise => TLColors.blue500;

  @override
  Color get standardFlavorPlastics => TLColors.orange500;

  @override
  Color get standardFlavorNeo => TLColors.green500;

  @override
  Color get standardFlavorComponents => TLColors.purple500;

  @override
  Color get standardFlavorElectronics => TLColors.pink500;

  @override
  Color get standardFlavorGuss => TLColors.red500;

  @override
  Color get updateStatusUpcoming => TLColors.purple500;
  
  @override
  Color get updateStatusOngoing => TLColors.blue500;

  @override
  Color get updateStatusSuccess => TLColors.green500;

  @override
  Color get updateStatusWarning => TLColors.orange500;

  @override
  Color get updateStatusError => TLColors.red500;
  
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
  Color get secondaryBackground => TLColors.gray200;

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

  @override
  Color get navigationRailAppNameForeground => TLColors.gray900;

  @override
  Color get navigationRailAppVersionForeground => TLColors.gray500;

  @override
  Color get navigationRailItemSelectedLeadingIcon => TLColors.white;

  @override
  Color get navigationRailItemUnselectedLeadingIcon => TLColors.gray500;

  @override
  Color get navigationRailItemSelectedTrailingIcon => TLColors.white;

  @override
  Color get navigationRailItemUnselectedTrailingIcon => TLColors.gray500;

  @override
  Color get navigationRailItemSelectedBackground => TLColors.timeline;

  @override
  Color get navigationRailItemSelectedTitleForeground => TLColors.white;

  @override
  Color get navigationRailItemUnselectedTitleForeground => TLColors.gray500;

  @override
  Color get iconButtonForeground => TLColors.gray900;

  @override
  Color get iconButtonCriticalForeground => TLColors.red500;

  @override
  Color get tableTitle => TLColors.gray900;

  @override
  Color get tableEmptyText => TLColors.gray900;

  @override
  Color get tableErrorText => TLColors.gray900;

  @override
  Color get tableButtonBackground => TLColors.timeline;

  @override
  Color get tableButtonForeground => TLColors.white;

  @override
  Color get tableReloadIcon => TLColors.gray900;

  @override
  Color get tableHeaderBackground => TLColors.gray200;

  @override
  Color get tableHeaderTitleForeground => TLColors.gray500;

  @override
  Color get tableCellText => TLColors.gray900;

  @override
  Color get tableCellIcon => TLColors.gray900;

  @override
  Color get chipBackgroundColor => TLColors.timeline;

  @override
  Color get chipForegroundColor => TLColors.white;

  @override
  Color get radioButtonSelectedBorder => TLColors.timeline;

  @override
  Color get radioButtonUnselectedBorder => TLColors.gray500;

  @override
  Color get radioButtonIndicator => TLColors.timeline;

  @override
  Color get radioButtonSelectedTitleForeground => TLColors.gray900;

  @override
  Color get radioButtonUnselectedTitleForeground => TLColors.gray500;

  @override
  Color get tabBarBackground => TLColors.gray200;

  @override
  Color get tabBarSelectedBackground => TLColors.white;

  @override
  Color get tabBarSelectedForeground => TLColors.gray900;

  @override
  Color get tabBarUnselectedForeground => TLColors.gray500;

  @override
  Color get dialogBackground => TLColors.white;

  @override
  Color get dialogLeadingIconBorder => TLColors.gray200;

  @override
  Color get dialogLeadingIcon => TLColors.gray900;

  @override
  Color get dialogTitle => TLColors.gray900;

  @override
  Color get dialogDescription => TLColors.gray500;

  @override
  Color get dialogPrimaryButtonBackground => TLColors.timeline;

  @override
  Color get dialogPrimaryButtonForeground => TLColors.white;

  @override
  Color get dialogSecondaryButtonBackground => TLColors.gray300;

  @override
  Color get dialogSecondaryButtonForeground => TLColors.gray900;

  @override
  Color get separator => TLColors.gray200;

  @override
  Color get dropZoneBorder => TLColors.gray200;

  @override
  Color get dropZoneBackground => TLColors.gray200;

  @override
  Color get dropZoneHoveringBackground => TLColors.blue200;

  @override
  Color get dropZoneClickableTextForeground => TLColors.gray900;

  @override
  Color get dropZoneOtherTextForeground => TLColors.gray900;

  @override
  Color get textButtonForeground => TLColors.gray900;

  @override
  Color get dateTimePickerBackground => TLColors.white;

  @override
  Color get dateTimePickerText => TLColors.gray900;

  @override
  Color get dateTimePickerActiveColor => TLColors.timeline;

  @override
  Color get dateTimePickerActiveTextColor => TLColors.gray100;

  @override
  Color get dateTimePickerForeground => TLColors.gray200;

  @override
  Color get dateTimePickerFieldBackground => TLColors.gray200;

  @override
  Color get dateTimePickerFieldIcon => TLColors.gray900;

  @override
  Color get dateTimePickerFieldEmptyTextForeground => TLColors.gray500;

  @override
  Color get dateTimePickerFieldForeground => TLColors.gray900;

  @override
  Color get settingsDescription => TLColors.gray900;

  @override
  Color get settingsSectionTitle => TLColors.gray900;

  @override
  Color get settingsSectionDescription => TLColors.gray500;

  @override
  Color get settingsSectionItemTitle => TLColors.gray900;
}

/// Holds all dark colors
class TLColorDataDark implements TLColorable {

  /// Default constructor
  const TLColorDataDark();

  @override
  Color get userTypeAdmin => TLColors.green600;

  @override
  Color get userTypeEmployee => TLColors.orange600;

  @override
  Color get userTypeCustomer => TLColors.purple600;

  @override
  Color get standardTypeServer => TLColors.blue600;

  @override
  Color get standardTypeClient => TLColors.purple600;

  @override
  Color get standardEvolutionE3 => TLColors.green600;

  @override
  Color get standardVersionV15 => TLColors.blue600;

  @override
  Color get standardVersionV15_5 => TLColors.purple600;

  @override
  Color get standardVersionV16 => TLColors.orange600;

  @override
  Color get standardFlavorEnterprise => TLColors.blue600;

  @override
  Color get standardFlavorPlastics => TLColors.orange600;

  @override
  Color get standardFlavorNeo => TLColors.green600;

  @override
  Color get standardFlavorComponents => TLColors.purple600;

  @override
  Color get standardFlavorElectronics => TLColors.pink600;

  @override
  Color get standardFlavorGuss => TLColors.red600;

  @override
  Color get updateStatusUpcoming => TLColors.purple600;
  
  @override
  Color get updateStatusOngoing => TLColors.blue600;

  @override
  Color get updateStatusSuccess => TLColors.green600;

  @override
  Color get updateStatusWarning => TLColors.orange600;

  @override
  Color get updateStatusError => TLColors.red600;
  
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
  Color get secondaryBackground => TLColors.gray800;

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

  @override
  Color get navigationRailAppNameForeground => TLColors.gray100;

  @override
  Color get navigationRailAppVersionForeground => TLColors.gray400;

  @override
  Color get navigationRailItemSelectedLeadingIcon => TLColors.white;

  @override
  Color get navigationRailItemUnselectedLeadingIcon => TLColors.gray400;

  @override
  Color get navigationRailItemSelectedTrailingIcon => TLColors.white;

  @override
  Color get navigationRailItemUnselectedTrailingIcon => TLColors.gray400;

  @override
  Color get navigationRailItemSelectedBackground => TLColors.timeline;

  @override
  Color get navigationRailItemSelectedTitleForeground => TLColors.white;

  @override
  Color get navigationRailItemUnselectedTitleForeground => TLColors.gray400;

  @override
  Color get iconButtonForeground => TLColors.gray100;

  @override
  Color get iconButtonCriticalForeground => TLColors.red600;

  @override
  Color get tableTitle => TLColors.gray100;

  @override
  Color get tableEmptyText => TLColors.gray100;

  @override
  Color get tableErrorText => TLColors.gray100;

  @override
  Color get tableButtonBackground => TLColors.timeline;

  @override
  Color get tableButtonForeground => TLColors.white;

  @override
  Color get tableReloadIcon => TLColors.gray100;

  @override
  Color get tableHeaderBackground => TLColors.gray800;

  @override
  Color get tableHeaderTitleForeground => TLColors.gray400;

  @override
  Color get tableCellText => TLColors.gray100;

  @override
  Color get tableCellIcon => TLColors.gray100;

  @override
  Color get chipBackgroundColor => TLColors.timeline;

  @override
  Color get chipForegroundColor => TLColors.white;

  @override
  Color get radioButtonSelectedBorder => TLColors.timeline;

  @override
  Color get radioButtonUnselectedBorder => TLColors.gray400;

  @override
  Color get radioButtonIndicator => TLColors.timeline;

  @override
  Color get radioButtonSelectedTitleForeground => TLColors.gray100;

  @override
  Color get radioButtonUnselectedTitleForeground => TLColors.gray400;

  @override
  Color get tabBarBackground => TLColors.gray800;

  @override
  Color get tabBarSelectedBackground => TLColors.gray900;

  @override
  Color get tabBarSelectedForeground => TLColors.gray100;

  @override
  Color get tabBarUnselectedForeground => TLColors.gray400;

  @override
  Color get dialogBackground => TLColors.gray900;

  @override
  Color get dialogLeadingIconBorder => TLColors.gray800;

  @override
  Color get dialogLeadingIcon => TLColors.gray100;

  @override
  Color get dialogTitle => TLColors.gray100;

  @override
  Color get dialogDescription => TLColors.gray400;

  @override
  Color get dialogPrimaryButtonBackground => TLColors.timeline;

  @override
  Color get dialogPrimaryButtonForeground => TLColors.white;

  @override
  Color get dialogSecondaryButtonBackground => TLColors.gray700;

  @override
  Color get dialogSecondaryButtonForeground => TLColors.gray100;

  @override
  Color get separator => TLColors.gray800;

  @override
  Color get dropZoneBorder => TLColors.gray800;

  @override
  Color get dropZoneBackground => TLColors.gray800;

  @override
  Color get dropZoneHoveringBackground => TLColors.blue300;

  @override
  Color get dropZoneClickableTextForeground => TLColors.gray100;

  @override
  Color get dropZoneOtherTextForeground => TLColors.gray100;

  @override
  Color get textButtonForeground => TLColors.gray100;

  @override
  Color get dateTimePickerBackground => TLColors.gray900;

  @override
  Color get dateTimePickerText => TLColors.gray100;

  @override
  Color get dateTimePickerActiveColor => TLColors.timeline;

  @override
  Color get dateTimePickerActiveTextColor => TLColors.gray900;

  @override
  Color get dateTimePickerForeground => TLColors.gray800;

  @override
  Color get dateTimePickerFieldBackground => TLColors.gray800;

  @override
  Color get dateTimePickerFieldIcon => TLColors.gray100;

  @override
  Color get dateTimePickerFieldEmptyTextForeground => TLColors.gray400;

  @override
  Color get dateTimePickerFieldForeground => TLColors.gray100;

  @override
  Color get settingsDescription => TLColors.gray100;

  @override
  Color get settingsSectionTitle => TLColors.gray100;

  @override
  Color get settingsSectionDescription => TLColors.gray400;

  @override
  Color get settingsSectionItemTitle => TLColors.gray100;
}