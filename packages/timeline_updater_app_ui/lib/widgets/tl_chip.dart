import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom chip
class TLChip extends StatelessWidget {

  /// The callback when the chip is pressed
  final VoidCallback? onPressed;

  /// The title
  final String title;

  /// Whether the chip is enabled
  final bool isEnabled;

  /// The background color of the chip
  final Color? backgroundColor;

  /// The foreground color of the chip
  final Color? foregroundColor;

  /// Default Constructor
  const TLChip.basic({
    super.key,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
  })  : onPressed = null,
        isEnabled= false;

  /// Constructor for delete chips
  const TLChip.clickable({
    super.key,
    required this.title,
    this.onPressed,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return SizedBox(
      height: 36.0,
      child: IntrinsicWidth(
        child: RawMaterialButton(
          onPressed: isEnabled ? onPressed : null,
          enableFeedback: isEnabled,
          fillColor: backgroundColor ?? colors.chipBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: TLSpacing.md),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: TLText(
              text: title,
              alignment: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: foregroundColor ?? colors.chipForegroundColor
              )
            )
          )
        )
      )
    );
  }
}