import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';

/// A custom class holding all localizable strings per language
class CustomLanguageData implements TLLanguageData {

  @override
  TLLanguageDataDeDE get deDE => const CustomLanguageDataDeDE();

  @override
  TLLanguageDataEnUS get enUS => const CustomLanguageDataEnUS();

  /// Default constructor
  const CustomLanguageData();
}

/// Holds all de-DE localized strings
class CustomLanguageDataDeDE extends TLLanguageDataDeDE implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataDeDE();

  @override
  String test2() {
    return 'Test 2 (de-DE)';
  }
}

/// Holds all en-US localized strings
class CustomLanguageDataEnUS extends TLLanguageDataEnUS implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataEnUS();

  @override
  String test2() {
    return 'Test 2 (en-US)';
  }
}