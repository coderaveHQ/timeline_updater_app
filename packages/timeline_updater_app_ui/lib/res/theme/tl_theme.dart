import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A class that holds information about the theme
class TLTheme extends InheritedWidget {

  /// The color mode
  final TLColorMode colorMode;

  /// Holds all colors per color theme
  final TLColorData colorData;

  /// Default constructor
  const TLTheme({
    super.key,
    required super.child,
    required this.colorMode,
    required this.colorData
  });

  @override
  bool updateShouldNotify(covariant TLTheme oldWidget) {
    return oldWidget != oldWidget;
  }

  /// Gets the `TLTheme`widget based on the context
  static TLTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLTheme>()!;
  }

  /// Gets the color mode based on the context
  static TLColorMode colorModeOf(BuildContext context, { bool specifySystem = false }) {
    TLColorMode colorMode = of(context).colorMode;
    if (colorMode == TLColorMode.system && specifySystem) colorMode = _systemColorMode;
    return colorMode;
  }

  /// Gets the color data based on the context
  static TLColorData colorDataOf(BuildContext context) {
    return of(context).colorData;
  }

  /// Gets the colors based on the context
  static C colorsOf<C extends TLColorable>(BuildContext context) {
    final TLColorMode colorMode = colorModeOf(context);
    final TLColorData colorData = colorDataOf(context);

    TLColorable colorable = switch (colorMode) {
      TLColorMode.light => colorData.light,
      TLColorMode.dark => colorData.dark,
      TLColorMode.system => _getSystemColorData(colorData)
    };

    return colorable as C;
  }

  /// Gets the color mode of the system
  static TLColorMode get _systemColorMode {
    final Brightness systemBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return switch (systemBrightness) {
      Brightness.light => TLColorMode.light,
      Brightness.dark => TLColorMode.dark
    };
  }

  /// Gets the colorable data based on the systems locale
  static TLColorable _getSystemColorData(TLColorData colorData) {
    return switch (_systemColorMode) {
      TLColorMode.light => colorData.light,
      TLColorMode.dark => colorData.dark,
      _ => throw Exception('Color mode from system was of type `system` again.')
    };
  }
}