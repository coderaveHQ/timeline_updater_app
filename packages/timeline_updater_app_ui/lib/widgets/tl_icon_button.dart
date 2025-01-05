import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';

/// A custom icon button widget
class TLIconButton extends StatelessWidget {

  /// The icon to be displayed
  final IconData icon;

  /// Callback for when the button was pressed
  final void Function()? onPressed;

  /// Wether the button is enabled
  final bool isEnabled;

  /// The size of the button
  final double size;

  /// The color of the icon
  final Color? color;

  /// Wether should be styled like a critical button
  final bool critical;

  /// Default constructor
  const TLIconButton({ 
    super.key,
    required this.icon,
    this.onPressed,
    this.isEnabled = true,
    this.size = 18.0,
    this.color,
    this.critical = false
  });

  void _onPressed() {
    if (isEnabled) onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onPressed,
        child: Icon(
          icon,
          size: size,
          color: color ?? (critical ? colors.iconButtonCriticalForeground : colors.iconButtonForeground)
        )
      )
    );
  }
}