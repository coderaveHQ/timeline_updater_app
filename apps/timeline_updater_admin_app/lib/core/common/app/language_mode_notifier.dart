import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/services/custom_preferences.dart';

part 'language_mode_notifier.g.dart';

/// A notifier for interacting with the current language mode
@riverpod
class LanguageModeNotifier extends _$LanguageModeNotifier {

  late final CustomPreferences _preferences;

  @override
  TLLanguageMode build() {
    _preferences = ref.read(customPreferencesProvider);
    return _preferences.getLanguageMode();
  }

  /// Sets the language mode
  Future<void> setLanguageMode(TLLanguageMode languageMode) async {
    state = languageMode;
  }
}