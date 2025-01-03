import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_circular_progress_indicator.dart';

/// A custom square button
class TLSquareButton extends StatelessWidget {

  /// The onPressed callback
  final VoidCallback? onPressed;

  /// Indicates wether the button displays a loading indicator or a title
  final bool isLoading;

  /// Indicates wether the button is enabled
  final bool isEnabled;

  /// The icon
  final IconData icon;

  /// The background color
  final Color? backgroundColor;

  /// The foreground color
  final Color? foregroundColor;

  /// The size
  final double size;

  /// The border radius
  final double borderRadius;

  /// Default constructor
  const TLSquareButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.size = 52.0,
    this.borderRadius = 12.0
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return SizedBox.square(
      dimension: size,
      child: RawMaterialButton(
        onPressed: isEnabled ? onPressed : null,
        fillColor: backgroundColor ?? colors.squareButtonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        enableFeedback: isEnabled,
        child: isLoading
          ? TLCircularProgressIndicator(
            color: foregroundColor ?? colors.squareButtonForeground,
            size: 24.0
          )
          : Icon(
            icon,
            size: 24.0,
            color: foregroundColor ?? colors.squareButtonForeground,
          )
      )
    );
  }
}