import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';

/// A custom Text
class TLText extends StatelessWidget {

  /// The text
  final String text;

  /// The maximum number of lines
  final int? maxLines;

  /// The text overflow
  final TextOverflow? overflow;

  /// The text alignment
  final TextAlign? alignment;
  
  /// The text style
  final TextStyle? style;

  /// Default constructor
  const TLText({ 
    super.key,
    this.text = '',
    this.maxLines,
    this.overflow,
    this.alignment,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: alignment,
      style: TLTypography.base.merge(style)
    );
  }
}