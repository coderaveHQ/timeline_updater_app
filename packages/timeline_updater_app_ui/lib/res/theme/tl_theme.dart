import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme_data.dart';

/// A class specifying the theme used
class TLTheme extends InheritedWidget {

  /// The theme data
  final TLThemeData data;

  /// Default constructor
  const TLTheme({
    super.key,
    required super.child,
    required this.data
  });

  /// Gets the theme from the current context
  static TLThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLTheme>()!.data;
  }

  @override
  bool updateShouldNotify(covariant TLTheme oldWidget) {
    return data != oldWidget.data;
  }
}