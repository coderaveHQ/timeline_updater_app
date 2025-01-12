import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/extensions/build_context_x.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_circular_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// Custom App Bar widget
class TLAppBar extends StatelessWidget implements PreferredSizeWidget {

  /// The BuildContext from where the widget is built
  final BuildContext context;

  /// Wether there is a navigation rail, because then there is no need for subtracting the devices left padding
  final bool navigationRailExists;

  /// Back button
  final TLAppBarBackButton? backButton;

  /// Title
  final String title;

  /// Action buttons
  final List<TLAppBarButton> actionButtons;

  /// Default constructor
  const TLAppBar({ 
    super.key,
    required this.context,
    this.navigationRailExists = false,
    this.backButton,
    this.title = '',
    this.actionButtons = const <TLAppBarButton>[]
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (navigationRailExists ? 0.0 : context.topPadding));

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: colors.appBarBackground,
      padding: EdgeInsets.only(
        top: navigationRailExists ? 0.0 : context.topPadding,
        left: (navigationRailExists ? 0.0 : context.leftPadding) + TLSpacing.lg,
        right: context.rightPadding + TLSpacing.lg
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (backButton != null) backButton!,
          if (backButton != null) const Gap(TLSpacing.md),
          Expanded(
            child: TLText(
              text: title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: colors.appBarTitle
              )
            )
          ),
          if (actionButtons.isNotEmpty) const Gap(TLSpacing.md),
          if (actionButtons.isNotEmpty) Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(actionButtons.length, (int index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0.0 : TLSpacing.md),
                child: actionButtons[index]
              );
            })
          )
        ]
      )
    );
  }
}

/// Custom App Bar button widget
class TLAppBarButton extends StatelessWidget {

  /// On pressed callback
  final void Function()? onPressed;

  /// Whether the button is loading
  final bool isLoading;

  /// Wether the button is enabled
  final bool isEnabled;

  /// Icon
  final IconData icon;

  /// Default constructor
  const TLAppBarButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return TLCircularButton(
      onPressed: onPressed,
      size: kToolbarHeight - 8.0,
      isLoading: isLoading,
      isEnabled: isEnabled,
      backgroundColor: colors.appBarButtonBackground,
      foregroundColor: colors.appBarButtonForeground,
      icon: icon
    );
  }
}

/// Custom App Bar back button widget
class TLAppBarBackButton extends StatelessWidget {

  /// On pressed callback
  final bool Function()? onPressed;

  /// Whether the button is loading
  final bool isLoading;

  /// Wether the button is enabled
  final bool isEnabled;

  /// Default constructor
  const TLAppBarBackButton({ 
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true
  });

  /// On pressed callback with a check weather the action should be called
  void _onPressed(BuildContext context) {
    if (!isLoading && isEnabled) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isEnabled && !isLoading,
      child: TLAppBarButton(
        onPressed: () => _onPressed(context),
        isLoading: isLoading,
        isEnabled: isEnabled,
        icon: LucideIcons.arrowLeft
      )
    );
  }
}