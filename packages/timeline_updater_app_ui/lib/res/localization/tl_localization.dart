import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';

/// A class that holds information about the localization
class TLLocalization extends InheritedWidget {

  /// Holds all localizable strings per language
  final TLLanguageData language;

  /// Default constructor
  const TLLocalization({
    super.key,
    required super.child,
    required this.language
  });

  /// Gets the `TLLocalization`widget based on the context
  static TLLocalization of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLLocalization>()!;
  }

  /// Gets the localized strings based on the context
  static L languageOf<L extends TLLocalizable>(BuildContext context) {
    // TODO Get reactive language mode based on preferences
    return of(context).language.deDE as L;
  }

  @override
  bool updateShouldNotify(covariant TLLocalization oldWidget) {
    return oldWidget != oldWidget;
  }
}