import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';

class TLTabBar extends StatelessWidget implements PreferredSizeWidget {

  final TabController controller;
  final List<String>? titles;

  const TLTabBar({
    super.key,
    required this.controller,
    this.titles
  });

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: colors.tabBarBackground
      ),
      child: TabBar(
        controller: controller,
        labelColor: colors.tabBarSelectedForeground,
        unselectedLabelColor: colors.tabBarUnselectedForeground,
        labelStyle: TLTypography.base.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: TLTypography.base.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w400
        ),
        indicator: BoxDecoration(
          color: colors.tabBarSelectedBackground,
          borderRadius: BorderRadius.circular(12.0 - TLSpacing.xs)
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        padding: const EdgeInsets.all(TLSpacing.xs),
        labelPadding: const EdgeInsets.symmetric(horizontal: TLSpacing.lg),
        tabAlignment: TabAlignment.fill,
        dividerHeight: 0.0,
        tabs: (titles ?? []).map((String title) => Tab(text: title)).toList()
      )
    );
  }
}