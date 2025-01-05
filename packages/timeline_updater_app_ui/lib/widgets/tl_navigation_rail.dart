import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:timeline_updater_app_ui/extensions/build_context_x.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';
import 'package:timeline_updater_app_ui/utils/constants/tl_ui_constants.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom navigation rail
class TLNavigationRail extends StatelessWidget {

  /// The image path of the logo
  final String logoPath;

  /// The name of the App
  final String appName;

  /// The version of the App
  final String appVersion;

  /// A list of main items
  final List<TLNavigationRailItem> navigationItems;

  /// A list of bottom items
  final List<TLNavigationRailItem> bottomItems;

  /// Default constructor
  const TLNavigationRail({ 
    super.key,
    required this.logoPath,
    required this.appName,
    required this.appVersion,
    this.navigationItems = const <TLNavigationRailItem>[],
    this.bottomItems = const <TLNavigationRailItem>[]
  });

  @override
  Widget build(BuildContext context) {

    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;
    
    return SizedBox(
      width: context.leftPadding + 2 * TLSpacing.sm + (isExpanded ? 280.0 : 40.0),
      height: double.infinity,
      child: Column(
        children: [
          _TLNavigationRailTop(
            logoPath: logoPath,
            appName: appName,
            appVersion: appVersion
          ),
          const Gap(TLSpacing.xxl),
          _TLNavigationRailCenter(navigationItems: navigationItems), 
          const Gap(TLSpacing.sm),
          _TLNavigationRailBottom(bottomItems: bottomItems)
        ]
      )
    );
  }
}

/// A custom item widget for the navigation rail
class TLNavigationRailItem extends StatelessWidget {

  /// Callback for when the item was pressed
  final void Function()? onPressed;

  /// The title of the button
  final String title;

  /// The leading icon
  final IconData leadingIcon;

  /// The trailing icon
  final IconData? trailingIcon;

  /// Wether the item is currently selected
  final bool isSelected;

  /// Default constructor
  const TLNavigationRailItem({ 
    super.key,
    this.onPressed,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.isSelected = false
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;

    return SizedBox(
      height: 40.0,
      width: isExpanded ? 280.0 : 40.0,
      child: RawMaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: TLSpacing.sm),
        elevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        fillColor: isSelected ? colors.navigationRailItemSelectedBackground : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              leadingIcon,
              color: isSelected ? colors.navigationRailItemSelectedLeadingIcon : colors.navigationRailItemUnselectedLeadingIcon
            ),
            if (isExpanded) const Gap(TLSpacing.md),
            if (isExpanded) Expanded(
              child: TLText(
                text: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TLTypography.base.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? colors.navigationRailItemSelectedTitleForeground : colors.navigationRailItemUnselectedTitleForeground,
                )
              )
            ),
            if (isExpanded && trailingIcon != null) const Gap(TLSpacing.md),
            if (isExpanded && trailingIcon != null) Icon(
              trailingIcon,
              color: isSelected ? colors.navigationRailItemSelectedTrailingIcon : colors.navigationRailItemUnselectedTrailingIcon
            )
          ]
        )
      )
    );
  }
}

/// The top part of the navigation rail
class _TLNavigationRailTop extends StatelessWidget {

  /// The image path of the logo
  final String logoPath;

  /// The name of the App
  final String appName;

  /// The version of the App
  final String appVersion;

  /// Default constructor
  const _TLNavigationRailTop({
    required this.logoPath,
    required this.appName,
    required this.appVersion
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);
    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;

    return Padding(
      padding: EdgeInsets.only(
        top: context.topPadding + (kToolbarHeight - 40.0) / 2.0,
        left: context.leftPadding + TLSpacing.sm,
        right: TLSpacing.sm
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              logoPath,
              width: 40.0,
              height: 40.0
            )
          ),
          if (isExpanded) const Gap(TLSpacing.sm),
          if (isExpanded) Expanded(
            child: TLText(
              text: appName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TLTypography.base.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: colors.navigationRailAppNameForeground
              )
            )
          ),
          if (isExpanded) const Gap(TLSpacing.sm),
          if (isExpanded) TLText(
            text: 'v$appVersion',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            alignment: TextAlign.end,
            style: TLTypography.base.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: colors.navigationRailAppVersionForeground
            )
          )
        ]
      )
    );
  }
}

/// The center of the navigationRail
class _TLNavigationRailCenter extends StatelessWidget {

  /// A list of main items
  final List<TLNavigationRailItem> navigationItems;

  /// Default constructor
  const _TLNavigationRailCenter({
    this.navigationItems = const <TLNavigationRailItem>[],
  });

  @override
  Widget build(BuildContext context) {

    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: context.leftPadding + TLSpacing.sm,
          right: TLSpacing.sm
        ),
        child: Column(
          crossAxisAlignment: isExpanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: List.generate(navigationItems.length, (int index) {
            final TLNavigationRailItem item = navigationItems[index];
            final bool isLast = index == navigationItems.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0.0 : TLSpacing.sm),
              child: item
            );
          })
        )
      )
    );
  }
}

/// The bottom of the navigation rail
class _TLNavigationRailBottom extends StatelessWidget {

  /// A list of bottom items
  final List<TLNavigationRailItem> bottomItems;

  /// Default constructor
  const _TLNavigationRailBottom({
    this.bottomItems = const <TLNavigationRailItem>[]
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.leftPadding + TLSpacing.sm,
        bottom: context.bottomPadding + TLSpacing.sm,
        right: TLSpacing.sm
      ),
      child: Column(
        children: List.generate(bottomItems.length, (int index) {
          final TLNavigationRailItem item = bottomItems[index];
          final bool isLastItem = index == bottomItems.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLastItem ? 0.0 : TLSpacing.sm),
            child: item
          );
        })
      )
    );
  }
}