import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_customer_app/src/features/auth/presentation/widgets/profile_button.dart';
import 'package:timeline_updater_customer_app/core/res/theme/custom_colorable.dart';

/// A widget to display above the main content
class MainTopBar extends StatelessWidget {

  /// Default constructor
  const MainTopBar({ super.key });

  @override
  Widget build(BuildContext context) {

    final CustomColorable colors = TLTheme.colorsOf(context);
    final String currentRouterPath = GoRouterState.of(context).fullPath!.toString();

    return Container(
      height: kToolbarHeight,
      color: colors.primaryBackground,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: TLSpacing.lg,
        right: context.rightPadding + TLSpacing.lg
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TLText(
                text: currentRouterPath,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: colors.mainTopBarPath
                )
              )
              
            )
          ),
          const Gap(TLSpacing.lg),
          const ProfileButton()
        ]
      )
    );
  }
}