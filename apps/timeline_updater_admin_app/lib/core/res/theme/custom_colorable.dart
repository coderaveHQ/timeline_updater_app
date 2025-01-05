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

  /// Create user page title color
  Color get createUserTitle;

  /// Create user page subtitle color
  Color get createUserSubtitle;

  /// Users page description
  Color get usersDescription;
}