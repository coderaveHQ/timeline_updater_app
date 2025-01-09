import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:easy_popover/easy_popover.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/src/features/auth/domain/entities/profile_entity.dart';
import 'package:timeline_updater_app/src/features/auth/presentation/app/get_current_profile_provider.dart';
import 'package:timeline_updater_app/src/features/auth/presentation/widgets/sign_out_button.dart';
import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';

/// A custom button for displaying profile information about the currently logged in user
class ProfileButton extends ConsumerStatefulWidget {

  /// Default constructor
  const ProfileButton({ super.key });

  @override
  ConsumerState<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends ConsumerState<ProfileButton> {

  late final PopoverController _popoverController;

  @override
  void initState() {
    super.initState();

    _popoverController = PopoverController();
  }

  @override
  void dispose() {
    _popoverController.dispose();

    super.dispose();
  }

  void _handleShowPopover() {
    _popoverController.open();
  }

  @override
  Widget build(BuildContext context) {

    final CustomColorable colors = TLTheme.colorsOf(context);
    final AsyncValue<ProfileEntity> asyncProfile = ref.watch(getCurrentProfileProvider);

    final String nameText = switch (asyncProfile) {
      AsyncData<ProfileEntity>(:final value) => value.name,
      AsyncError<ProfileEntity>() => '???',
      _ => 'Florian Leeser'
    };
    
    return Popover(
      context,
      controller: _popoverController,
      hideArrow: true,
      backgroundColor: colors.profileButtonPopoverBackground,
      borderRadius: BorderRadius.circular(12.0),
      contentWidth: 350.0,
      alignment: PopoverAlignment.topRight,
      action: RawMaterialButton(
        onPressed: _handleShowPopover,
        padding: EdgeInsets.all(TLSpacing.xs),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Skeletonizer(
          enabled: asyncProfile.isLoading,
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
                text: nameText,
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
        )
      ),
      content: Material(
        child: Padding(
          padding: const EdgeInsets.all(TLSpacing.md),
          child: const SignOutButton()
        )
      )
    );
  }
}