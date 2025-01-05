import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/common/app/color_mode_notifier.dart';
import 'package:timeline_updater_admin_app/core/common/app/language_mode_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/auth/presentation/widgets/custom_auth_state_wrapper.dart';
import 'package:timeline_updater_admin_app/core/res/theme/custom_color_data.dart';
import 'package:timeline_updater_admin_app/core/services/router.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_language_data.dart';

/// The main application widget
class App extends ConsumerWidget {

  /// Default constructor
  const App({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GoRouter router = ref.watch(routerProvider);
    final TLLanguageMode languageMode = ref.watch(languageModeNotifierProvider);
    final TLColorMode colorMode = ref.watch(colorModeNotifierProvider);
    
    return TLApp(
      router: router,
      languageMode: languageMode,
      colorMode: TLColorMode.light,
      languageData: CustomLanguageData(),
      colorData: CustomColorData(),
      builder: (Widget child) => CustomAuthStateWrapper(child: child)
    );
  }
}