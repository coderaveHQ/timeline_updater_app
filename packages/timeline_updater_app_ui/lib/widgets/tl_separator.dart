import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';

/// A custom separator widget
class TLSeparator extends StatelessWidget {

  /// The color of the line
  final Color? color;

  /// The height of the line
  final double height;

  /// The width of the line
  final double width;

  /// The border radius at both ends of the line
  final double borderRadius;

  /// The padding around the line
  final EdgeInsets? padding;

  /// Default constructor
  const TLSeparator({
    super.key,
    this.color,
    this.height = 1.0,
    this.width = double.infinity,
    this.borderRadius = 0.0,
    this.padding
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? colors.separator,
          borderRadius: BorderRadius.circular(borderRadius)
        )
      )
    );
  }
}