import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';

/// A custom circular progress indicator
class TLCircularProgressIndicator extends StatelessWidget {

  /// The size
  final double size;

  /// The color
  final Color? color;

  /// Default constructor
  const TLCircularProgressIndicator({
    super.key,
    this.size = 18.0,
    this.color
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(color: color ?? colors.circularProgressIndicator)
    );
  }
}