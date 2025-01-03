import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_app_bar.dart';

/// A custom Scaffold
class TLScaffold extends StatelessWidget {

  /// The background color
  final Color? backgroundColor;

  /// The App Bar
  final TLAppBar? appBar;
  
  /// The body
  final Widget? body;

  /// Default constructor
  const TLScaffold({
    super.key,
    this.backgroundColor,
    this.appBar,
    this.body
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: colors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: colors.systemNavigationBarIconBrightness,
        systemNavigationBarDividerColor: colors.systemNavigationBarDividerColor,
        statusBarColor: colors.statusBarColor,
        statusBarBrightness: colors.statusBarBrightness,
        statusBarIconBrightness: colors.statusBarIconBrightness
      ),
      child: Scaffold(
        backgroundColor: backgroundColor ?? colors.primaryBackground,
        appBar: appBar,
        body: body
      )
    );
  }
}