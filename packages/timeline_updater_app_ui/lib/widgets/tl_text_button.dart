import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A custom widget for clickable text
class TLTextButton extends StatelessWidget {

  /// The text that will be clickable
  final String text;

  /// Wether the button is enabled
  final bool isEnabled;

  /// A callback for when the button was pressed
  final void Function()? onPressed;

  /// The color of the text
  final Color? color;

  /// Default constructor
  const TLTextButton({
    super.key,
    required this.text,
    this.isEnabled = true,
    this.onPressed,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    
    final TLColorable colors = TLTheme.colorsOf(context);

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: TLText(
          text: text,
          alignment: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: color ?? colors.textButtonForeground,
            decoration: TextDecoration.underline
          )
        )
      )
    );
  }
}