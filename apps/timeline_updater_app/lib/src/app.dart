import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/res/theme/custom_color_data.dart';
import 'package:timeline_updater_app/core/services/router.dart';
import 'package:timeline_updater_app/core/res/localization/custom_language_data.dart';

/// The main application widget
class App extends ConsumerWidget {

  /// Default constructor
  const App({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GoRouter router = ref.watch(routerProvider);
    
    return TLApp(
      router: router,
      language: CustomLanguageData(),
      colors: CustomColorData()
    );
  }
}