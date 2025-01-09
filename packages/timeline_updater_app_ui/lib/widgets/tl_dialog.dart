import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/utils/constants/tl_ui_constants.dart';
import 'package:timeline_updater_app_ui/widgets/tl_rectangle_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_separator.dart';
import 'package:timeline_updater_app_ui/widgets/tl_square_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom dialog widget
class TLDialog extends StatelessWidget {

  /// The leading icon
  final IconData leadingIcon;

  /// The title of the dialog
  final String title;

  /// The description of the dialog
  final String description;

  /// A list of widgets as the content of the dialog
  final List<Widget> content;

  /// Callback for checking if closing is enabled
  final bool Function()? canClose;

  /// The action button
  final TLDialogButton actionButton;

  /// The inner padding
  final EdgeInsets? innerPadding;

  /// Default constructor
  const TLDialog({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    this.content = const <Widget>[],
    this.canClose,
    required this.actionButton,
    this.innerPadding
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    
    return Dialog(
      backgroundColor: colors.dialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        width: TLUIConstants.maxWidthBreakpoint, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: TLSpacing.lg,
                  vertical: TLSpacing.md
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42.0,
                      height: 42.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 1.5,
                          color: colors.dialogLeadingIconBorder
                        )
                      ),
                      child: Icon(
                        LucideIcons.upload,
                        size: 26.0,
                        color: colors.dialogLeadingIcon
                      )
                    ),
                    const Gap(TLSpacing.lg),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TLText(
                            text: title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: colors.dialogTitle
                            )
                          ),
                          TLText(
                            text: description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: colors.dialogDescription
                            )
                          )
                        ]
                      )
                    ),
                    const Gap(TLSpacing.lg),
                    TLDialogCloseButton(canClose: canClose)
                  ]
                )
              ),
              TLSeparator(),
              const Gap(TLSpacing.lg),
              Padding(
                padding: innerPadding ?? EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ ...content ]
                )
              ),
              const Gap(TLSpacing.lg),
              TLSeparator(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: TLSpacing.lg,
                  vertical: TLSpacing.md
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _TLDialogCancelButton(canClose: canClose),
                    const Gap(TLSpacing.lg),
                    _TLDialogButton(
                      isPrimary: true,
                      button: actionButton
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}

/// The close button for the dialog title bar
class TLDialogCloseButton extends StatelessWidget {

  /// Callback for checking if closing is enabled
  final bool Function()? canClose;

  /// Default constructor
  const TLDialogCloseButton({
    super.key,
    this.canClose
  });

  @override
  Widget build(BuildContext context) {
    return TLSquareButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: LucideIcons.x,
      isEnabled: canClose?.call() ?? true,
      borderRadius: 12.0,
      size: 42.0
    );
  }
}

/// The action button of a dialog
class TLDialogButton {

  /// The onPressed callback
  final VoidCallback? onPressed;

  /// Indicates wether the button displays a loading indicator or a title
  final bool isLoading;

  /// Indicates wether the button is enabled
  final bool isEnabled;

  /// The title
  final String title;

  /// An icon to display in front of the title
  final IconData? icon;

  /// Default constructor
  const TLDialogButton({
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.title,
    this.icon
  });
}

/// A button widget for dialogs
class _TLDialogButton extends StatelessWidget {

  /// Wether is primary style
  final bool isPrimary;

  /// The actual button
  final TLDialogButton button;

  /// Default constructor
  const _TLDialogButton({
    required this.isPrimary,
    required this.button
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return TLRectangleButton(
      onPressed: button.onPressed,
      isEnabled: button.isEnabled,
      isLoading: button.isLoading,
      icon: button.icon,
      title: button.title,
      shrink: true,
      backgroundColor: isPrimary ? colors.dialogPrimaryButtonBackground : colors.dialogSecondaryButtonBackground,
      foregroundColor: isPrimary ? colors.dialogPrimaryButtonForeground : colors.dialogSecondaryButtonForeground
    );
  }
}

/// A button widget for dialogs
class _TLDialogCancelButton extends StatelessWidget {

  /// Callback for checking if closing is enabled
  final bool Function()? canClose;

  /// Default constructor
  const _TLDialogCancelButton({
    this.canClose
  });

  @override
  Widget build(BuildContext context) {

    final TLLocalizable translations = TLLocalization.translationsOf(context);

    return _TLDialogButton(
      isPrimary: false,
      button: TLDialogButton(
        onPressed: () => Navigator.of(context).pop(),
        isEnabled: canClose?.call() ?? true,
        title: translations.dialogCancelButtonTitle
      )
    );
  }
}