import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';

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

  /// Gets the locale of the language mode
  Locale get locale {
    return switch (this) {
      TLLanguageMode.en => const Locale('en'),
      TLLanguageMode.de => const Locale('de'),
      _ => _systemLocale.languageCode == 'de' ? const Locale('de') : const Locale('en')
    };
  }

  /// Gets the locale of the system
  Locale get _systemLocale {
    return SchedulerBinding.instance.platformDispatcher.locale;
  }

  /// Gets an instance of the language data based on the language mode
  TLLanguageData get data {
    return switch (this) {
      TLLanguageMode.system => _systemLanguageData,
      TLLanguageMode.en => TLLanguageData.en(),
      TLLanguageMode.de => TLLanguageData.de()
    };
  }

  /// Gets an instance of the language data for the system language mode
  TLLanguageData get _systemLanguageData {
    if (_systemLocale.languageCode == 'de') return TLLanguageData.de();
    return TLLanguageData.en();
  }

  /// Gets the language mode by the id
  static TLLanguageMode getLanguageModeById(int? id) {
    return TLLanguageMode.values.firstWhere((TLLanguageMode mode) => mode.id == id);
  }
}