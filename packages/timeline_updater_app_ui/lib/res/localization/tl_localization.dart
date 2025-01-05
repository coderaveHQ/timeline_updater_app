import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';

/// A class that holds information about the localization
class TLLocalization extends InheritedWidget {

  /// The language mode
  final TLLanguageMode languageMode;

  /// Holds all localizable strings per language
  final TLLanguageData languageData;

  /// Default constructor
  const TLLocalization({
    super.key,
    required super.child,
    required this.languageMode,
    required this.languageData
  });

  @override
  bool updateShouldNotify(covariant TLLocalization oldWidget) {
    return oldWidget != oldWidget;
  }

  /// Gets the `TLLocalization`widget based on the context
  static TLLocalization of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TLLocalization>()!;
  }

  /// Gets the language mode based on the context
  static TLLanguageMode languageModeOf(BuildContext context, { bool specifySystem = false }) {
    TLLanguageMode languageMode = of(context).languageMode;
    if (languageMode == TLLanguageMode.system) languageMode = _systemLanguageMode;
    return languageMode;
  }

  /// Gets the language data based on the context
  static TLLanguageData languageDataOf(BuildContext context) {
    return of(context).languageData;
  }

  /// Gets the localized strings based on the context
  static L translationsOf<L extends TLLocalizable>(BuildContext context) {
    final TLLanguageMode languageMode = languageModeOf(context);
    final TLLanguageData languageData = languageDataOf(context);

    TLLocalizable localizabe = switch (languageMode) {
      TLLanguageMode.en => languageData.en,
      TLLanguageMode.de => languageData.de,
      TLLanguageMode.system => _getSystemLanguageData(languageData)
    };

    return localizabe as L;
  }

  /// Gets the language mode of the system
  static TLLanguageMode get _systemLanguageMode {
    final Locale systemLocale = SchedulerBinding.instance.platformDispatcher.locale;
    if (systemLocale.languageCode == 'de') return TLLanguageMode.de;
    return TLLanguageMode.en;
  }

  /// Gets the localizable data based on the systems locale
  static TLLocalizable _getSystemLanguageData(TLLanguageData languageData) {
    return switch (_systemLanguageMode) {
      TLLanguageMode.de => languageData.de,
      TLLanguageMode.en => languageData.en,
      _ => throw Exception('Language mode from system was of type `system` again.')
    };
  }
}