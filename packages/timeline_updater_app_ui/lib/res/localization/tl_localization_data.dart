import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';

/// A class specifying all localiazable strings
class TLLocalizationData {

  /// The language mode
  final TLLanguageMode languageMode;

  /// Default constructor
  const TLLocalizationData({
    required this.languageMode
  });

  /// Gets the locale of the currently used language mode
  Locale get locale => languageMode.locale;

  /// Gets the instance of the language data used
  TLLanguageData get language => languageMode.data;
}