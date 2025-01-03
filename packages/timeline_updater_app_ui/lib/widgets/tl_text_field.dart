import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';

/// A custom TextField
class TLTextField extends StatelessWidget {

  /// The controller
  final TextEditingController? controller;

  /// The input type
  final TextInputType? inputType;

  /// The icon
  final IconData? icon;

  /// The hint
  final String? hint;

  /// Whether the text is obscured
  final bool obscure;

  /// Whether the text field is enabled
  final bool isEnabled;

  /// Wether autofocus is enabled
  final bool autofocus;

  /// A focus node for requesting focuses
  final FocusNode? focusNode;

  /// Default constructor
  const TLTextField({
    super.key,
    this.controller,
    this.inputType = TextInputType.text,
    this.icon,
    this.hint,
    this.obscure = false,
    this.isEnabled = true,
    this.autofocus = false,
    this.focusNode
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    final OutlineInputBorder noBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colors.textFieldInactiveBorder, 
        width: 2.0
      )
    );

    return TextField(
      keyboardAppearance: Brightness.dark,
      controller: controller,
      autocorrect: false,
      enabled: isEnabled,
      keyboardType: inputType,
      canRequestFocus: isEnabled,
      obscureText: obscure,
      cursorColor: colors.textFieldCursor,
      autofocus: autofocus,
      focusNode: focusNode,
      style: TLTypography.base.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: colors.textFieldForeground
      ),
      decoration: InputDecoration(
        fillColor: colors.textFieldBackground,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: TLSpacing.md,
          vertical: (52.0 - (icon != null ? 24.0 : 16.0)) / 2.0
        ),
        border: noBorder,
        errorBorder: noBorder,
        enabledBorder: noBorder,
        disabledBorder: noBorder,
        focusedErrorBorder: noBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: colors.textFieldActiveBorder,
            width: 2.0
          )
        ),
        prefixIconConstraints: const BoxConstraints.tightFor(height: 24.0),
        prefixIcon: icon != null
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: TLSpacing.md),
            child: Icon(
              icon,
              color: colors.textFieldIcon
            )
          )
          : null,
        hintText: hint,
        hintStyle: TLTypography.base.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: colors.textFieldHint
        )
      )
    );
  }
}