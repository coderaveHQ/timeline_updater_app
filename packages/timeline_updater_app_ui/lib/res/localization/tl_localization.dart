import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/tl_localization_data.dart';

/// A class holding all localization data
class TLLocalization extends InheritedWidget {

  /// The localization data to be used
  final TLLocalizationData data;

  /// Default constructor
  const TLLocalization({
    super.key,
    required super.child,
    required this.data
  });

  /// Gets the localization data from the current context
  static TLLocalizationData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLLocalization>()!.data;
  }

  @override
  bool updateShouldNotify(covariant TLLocalization oldWidget) {
    return data != oldWidget.data;
  }
}