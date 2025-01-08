import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_customer_app/core/common/app/color_mode_notifier.dart';
import 'package:timeline_updater_customer_app/core/common/app/language_mode_notifier.dart';
import 'package:timeline_updater_customer_app/core/services/custom_preferences.dart';

/// The settings page
class SettingsPage extends ConsumerWidget {

  /// Default constructor
  const SettingsPage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TLSettingsPage(
      preferences: ref.watch(customPreferencesProvider),
      onColorModeChanged: (TLColorMode colorMode) => ref.read(colorModeNotifierProvider.notifier).setColorMode(colorMode),
      onLanguageModeChanged: (TLLanguageMode languageMode) => ref.read(languageModeNotifierProvider.notifier).setLanguageMode(languageMode)
    );
  }
}