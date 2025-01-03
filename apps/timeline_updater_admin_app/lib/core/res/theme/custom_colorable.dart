import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A custom class holding all colors
abstract class CustomColorable extends TLColorable {
  
  /// Sign in page title color
  Color get signInTitle;

  /// Sign in page subtitle color
  Color get signInSubtitle;
}