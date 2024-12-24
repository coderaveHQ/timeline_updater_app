import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/sc_color_data.dart';

/// An enum specifying the available color modes
enum TLColorMode {

  /// The color mode system
  system(
    id: null
  ),
  /// The color mode light
  light(
    id: 1
  ),
  /// The color mode dark
  dark(
    id: 2
  );

  /// The id of the color mode
  final int? id;

  /// Default constructor
  const TLColorMode({
    this.id
  });

  /// Gets an instance of the color data based on the color mode
  TLColorData get data {
    return switch (this) {
      TLColorMode.system => _systemColorData,
      TLColorMode.light => TLColorData.light(),
      TLColorMode.dark => TLColorData.dark()
    };
  }

  /// Gets an instance of the color data for the system color mode
  TLColorData get _systemColorData {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light
      ? TLColorData.light()
      : TLColorData.dark();
  }

  /// Gets the color mode by the id
  static TLColorMode getColorModeById(int? id) {
    return TLColorMode.values.firstWhere((TLColorMode mode) => mode.id == id);
  }
}