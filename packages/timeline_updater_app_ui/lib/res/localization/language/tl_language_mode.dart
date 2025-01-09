import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An enum specifying the available language modes
enum TLLanguageMode {

  /// The system based language mode
  system(
    id: null
  ),

  /// The english language mode
  en(
    id: 1
  ),

  /// The german language mode
  de(
    id: 2
  );

  /// The id of the language mode
  final int? id;

  /// Default constructor
  const TLLanguageMode({
    this.id
  });

  /// Gets the language mode by the id
  static TLLanguageMode getLanguageModeById(int? id) {
    return TLLanguageMode.values.firstWhere((TLLanguageMode mode) => mode.id == id);
  }

  /// Gets the translated title of the enum value
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    return switch (this) {
      TLLanguageMode.system => translations.languageModeSystemTitle,
      TLLanguageMode.de => translations.languageModeDeTitle,
      TLLanguageMode.en => translations.languageModeEnTitle
    };
  }

  /// Gets the Locale of the language mode
  Locale get locale {
    return switch (this) {
      TLLanguageMode.system => _systemLocale,
      TLLanguageMode.de => Locale('de'),
      TLLanguageMode.en => Locale('en')
    };
  }

  /// Gets the locale based on the systems settings
  Locale get _systemLocale {
    final Locale systemLocale = SchedulerBinding.instance.platformDispatcher.locale;
    if (systemLocale.languageCode == 'de') return Locale('de');
    return Locale('en');
  }
}