import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';

class ProfileButton extends StatelessWidget {

  const ProfileButton({ super.key });

  @override
  Widget build(BuildContext context) {

    final CustomColorable colors = TLTheme.colorsOf(context);
    
    return RawMaterialButton(
      onPressed: () {},
      padding: EdgeInsets.all(TLSpacing.xs),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: colors.profileButtonAvatarBackground,
              borderRadius: BorderRadius.circular(12.0 - TLSpacing.xs)
            ),
            child: Icon(
              LucideIcons.userRound,
              color: colors.profileButtonAvatarIcon,
              size: 22.0
            )
          ),
          const Gap(TLSpacing.md),
          TLText(
            text: 'Florian Leeser',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: colors.profileButtonName
            )
          )
        ]
      )
    );
  }
}