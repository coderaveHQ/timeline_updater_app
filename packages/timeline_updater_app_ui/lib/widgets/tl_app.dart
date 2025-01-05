import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_mode.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';

/// The apps entry point
class TLApp extends StatefulWidget {

  /// The routing configuration
  final RouterConfig<Object>? router;

  /// The language mode to use
  final TLLanguageMode languageMode;

  /// The color mode to use
  final TLColorMode colorMode;

  /// Holds localized strings
  final TLLanguageData languageData;

  /// Holds colors
  final TLColorData colorData;

  /// Callback for building a widget wrapper
  final Widget Function(Widget)? builder;

  /// Defualt constructor
  const TLApp({
    super.key,
    required this.router,
    required this.languageMode,
    required this.colorMode,
    required this.languageData,
    required this.colorData,
    this.builder
  });

  @override
  State<TLApp> createState() => _TLAppState();
}

class _TLAppState extends State<TLApp> with WidgetsBindingObserver {

  /// Unfocuses the primary focus which will be the keyboard most of the time
  void _unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Reopens the keyboard in case color mode changed to also reflect changes there.
  /// 
  /// We use an artificial delay here since otherwise the keyboard brigthness does not change.
  Future<void> _reopenKeyboard() async {
    FocusNode? focusNode = FocusManager.instance.primaryFocus;

    if (focusNode != null) {
      focusNode.unfocus();
      await Future.delayed(const Duration(milliseconds: 100), () => focusNode.requestFocus());
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    if (widget.colorMode == TLColorMode.system) {
      // Rebuild the widget tree
      setState(() {});

      // Reopen the keyboard
      _reopenKeyboard();
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);

    if (widget.languageMode == TLLanguageMode.system) {
      // Rebuild the widget tree
      setState(() {});
    }
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
            languageMode: widget.languageMode,
            languageData: widget.languageData,
            child: TLTheme(
              colorMode: widget.colorMode,
              colorData: widget.colorData,
              child: widget.builder?.call(child!) ?? child!
            )
          );
        }
      )
    );
  }
}