import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/services/custom_preferences.dart';

part 'color_mode_notifier.g.dart';

/// A notifier for interacting with the current color mode
@riverpod
class ColorModeNotifier extends _$ColorModeNotifier {

  late final CustomPreferences _preferences;

  @override
  TLColorMode build() {
    _preferences = ref.read(customPreferencesProvider);
    return _preferences.getColorMode();
  }

  /// Sets the color mode
  Future<void> setColorMode(TLColorMode colorMode) async {
    state = colorMode;
  }
}