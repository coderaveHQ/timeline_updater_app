import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A class that holds information about the theme
class TLTheme extends InheritedWidget {

  /// Holds all colors per color theme
  final TLColorData colors;

  /// Default constructor
  const TLTheme({
    super.key,
    required super.child,
    required this.colors
  });

  /// Gets the `TLTheme`widget based on the context
  static TLTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLTheme>()!;
  }

  /// Gets the localized strings based on the context
  static C colorsOf<C extends TLColorable>(BuildContext context) {
    // TODO Get reactive color mode based on preferences
    return of(context).colors.light as C;
  }

  @override
  bool updateShouldNotify(covariant TLTheme oldWidget) {
    return oldWidget != oldWidget;
  }
}