import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom radio button widget
class TLRadioButton extends StatelessWidget {

  /// Callback for when the radio button was pressed
  final void Function()? onPressed;

  /// The text displayed next to the radio button
  final String title;

  /// Wether the radio button is selected
  final bool isSelected;

  /// Wether the radio button is enabled
  final bool enabled;

  /// Default constructor
  const TLRadioButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isSelected = false,
    this.enabled = true
  });

  void _onPressed() {
    if (enabled) onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onPressed,
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colors.radioButtonSelectedBorder : colors.radioButtonUnselectedBorder,
                  width: 1.5
                )
              ),
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? colors.radioButtonIndicator : null
                )
              )
            ),
            const Gap(TLSpacing.md),
            Flexible(
              child: TLText(
                text: title,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? colors.radioButtonSelectedTitleForeground : colors.radioButtonUnselectedTitleForeground
                )
              )
            )
          ]
        )
      )
    );
  }
}