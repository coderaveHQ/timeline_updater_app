import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_circular_progress_indicator.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom rectangle button
class TLRectangleButton extends StatelessWidget {

  /// The onPressed callback
  final VoidCallback? onPressed;

  /// Indicates wether the button displays a loading indicator or a title
  final bool isLoading;

  /// Indicates wether the button is enabled
  final bool isEnabled;

  /// The title
  final String title;

  /// The background color
  final Color? backgroundColor;

  /// The foreground color
  final Color? foregroundColor;

  /// Wether the button should be shrinked
  final bool shrink;

  /// An icon to display in front of the title
  final IconData? icon;

  /// Default constructor
  const TLRectangleButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.shrink = false,
    this.icon
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return SizedBox(
      width: shrink ? null : double.infinity,
      height: shrink ? 44.0 : 52.0,
      child: RawMaterialButton(
        onPressed: isEnabled ? onPressed : null,
        fillColor: backgroundColor ?? colors.rectangleButtonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        padding: const EdgeInsets.symmetric(horizontal: TLSpacing.lg),
        enableFeedback: isEnabled,
        child: isLoading
          ? TLCircularProgressIndicator(
            color: foregroundColor ?? colors.rectangleButtonForeground,
            size: shrink ? 16.0 : 18.0
          )
          : Row(
            children: [
              if (icon != null) Padding(
                padding: EdgeInsets.only(right: TLSpacing.md),
                child: Icon(
                  icon,
                  size: shrink ? 16.0 : 18.0,
                  color: foregroundColor ?? colors.rectangleButtonForeground
                )
              ),
              TLText(
                text: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                alignment: TextAlign.center,
                style: TextStyle(
                  fontSize: shrink ? 16.0 : 18.0,
                  fontWeight: FontWeight.w600,
                  color: foregroundColor ?? colors.rectangleButtonForeground,
                )
              )
            ]
          )
      )
    );
  }
}