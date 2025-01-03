import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_square_button.dart';

/// A custom circular button
class TLCircularButton extends StatelessWidget {

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

  /// Default constructor
  const TLCircularButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.size = 52.0
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return TLSquareButton(
      onPressed: onPressed,
      isLoading: isLoading,
      isEnabled: isEnabled,
      icon: icon,
      backgroundColor: backgroundColor ?? colors.circularButtonBackground,
      foregroundColor: foregroundColor ?? colors.circularButtonForeground,
      size: size,
      borderRadius: size / 2.0
    );
  }
}