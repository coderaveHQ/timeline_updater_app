import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A custom class holding all colors
abstract class CustomColorable extends TLColorable {

  /// The color of the main top bar path
  Color get mainTopBarPath;

  /// The background color of the profile button avatar
  Color get profileButtonAvatarBackground;

  /// The color of the profile button avatar icon
  Color get profileButtonAvatarIcon;

  /// The color of the name inside the profile button
  Color get profileButtonName;

  /// The background color of the profile button popover
  Color get profileButtonPopoverBackground;
  
  /// Sign in page title color
  Color get signInTitle;

  /// Sign in page subtitle color
  Color get signInSubtitle;

  /// Standards page description
  Color get standardsDescription;

  /// The color of the upload standard dialog section title
  Color get uploadStandardDialogSectionTitle;

  /// The color of the text when no file is selected in the upload standard dialog
  Color get uploadStandardDialogNoFileSelectedForeground;

  /// The color of the text when a file is selected in the upload standard dialog
  Color get uploadStandardDialogFileSelectedForeground;

  /// The background color of an unselected chip
  Color get uploadStandardDialogUnselectedChipBackground;

  /// The foreground color of an unselected chip
  Color get uploadStandardDialogUnselectedChipForeground;
}