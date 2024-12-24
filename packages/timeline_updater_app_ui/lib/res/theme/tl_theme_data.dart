import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_mode.dart';

/// A class specifying the theme data used
class TLThemeData {

  /// The color mode
  final TLColorMode colorMode;

  /// Default constructor
  const TLThemeData({
    required this.colorMode
  });

  /// Gets the color data
  TLColorData get colors => colorMode.data;

  /// Can be used to get a color based on the color mode
  Color color({
    required Color light, 
    required Color dark 
  }) {
    return switch (colorMode) {
      TLColorMode.light => light,
      TLColorMode.dark => dark,
      TLColorMode.system => SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light
        ? light
        : dark
    };
  }
}