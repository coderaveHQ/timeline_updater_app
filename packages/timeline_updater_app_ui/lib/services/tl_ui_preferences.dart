import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_mode.dart';

/// A custom class for storing UI preferences
class TLUIPreferences extends TLPreferences {
  
  /// Default constructor
  const TLUIPreferences(super.sharedPreferences);

  /// Key for the color mode
  static const String kColorModeKey = 'color-mode';

  /// Gets the stored color mode
  TLColorMode getColorMode() {
    final int? colorModeId = sharedPreferences.getInt(kColorModeKey);
    return TLColorMode.getColorModeById(colorModeId);
  }

  /// Sets the color mode
  Future<void> setColorMode(TLColorMode colorMode) async {
    if (colorMode == TLColorMode.system) {
      await removeColorMode();
    } else {
      await sharedPreferences.setInt(kColorModeKey, colorMode.id!);
    }
  }

  /// Removes the color mode
  Future<void> removeColorMode() async {
    await sharedPreferences.remove(kColorModeKey);
  }

  /// Key for the language mode
  static const String kLanguageModeKey = 'language-mode';

  /// Gets the stored language mode
  TLLanguageMode getLanguageMode() {
    final int? languageModeId = sharedPreferences.getInt(kLanguageModeKey);
    return TLLanguageMode.getLanguageModeById(languageModeId);
  }

  /// Sets the language mode
  Future<void> setLanguageMode(TLLanguageMode languageMode) async {
    if (languageMode == TLLanguageMode.system) {
      await removeLanguageMode();
    } else {
      await sharedPreferences.setInt(kLanguageModeKey, languageMode.id!);
    }
  }

  /// Removes the language mode
  Future<void> removeLanguageMode() async {
    await sharedPreferences.remove(kLanguageModeKey);
  }
}