import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';

/// A class for setting properties that can be retrieved in the App
class TLApp extends StatefulWidget {

  /// The routing configuration
  final RouterConfig<Object>? router;

  /// Holds localized strings
  final TLLanguageData language;

  /// Holds colors
  final TLColorData colors;

  /// Defualt constructor
  const TLApp({
    super.key,
    required this.router,
    required this.language,
    required this.colors
  });

  @override
  State<TLApp> createState() => _TLAppState();
}

class _TLAppState extends State<TLApp> {

  /// Unfocuses the primary focus which will be the keyboard most of the time
  void _unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusKeyboard,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: widget.router,
        builder: (BuildContext context, Widget? child) {
          return TLLocalization(
            language: widget.language,
            child: TLTheme(
              colors: widget.colors,
              child: child!
            )
          );
        }
      )
    );
  }
}