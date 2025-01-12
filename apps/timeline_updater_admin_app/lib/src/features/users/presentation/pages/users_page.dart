import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/src/features/users/presentation/app/profiles_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/users/presentation/widgets/profiles_table.dart';
import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// The users page
class UsersPage extends ConsumerWidget {

  /// Default constructor
  const UsersPage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final bool isLoadingProfiles = ref.watch(profilesTableStateNotifierProvider).isLoading;

    return TLScaffold(
      appBar: TLAppBar(
        context: context,
        navigationRailExists: true,
        title: translations.usersAppBarTitle,
        actionButtons: [
          TLAppBarButton(
            onPressed: () => ref.read(profilesTableStateNotifierProvider.notifier).forceRefresh(),
            icon: LucideIcons.refreshCw,
            isEnabled: !isLoadingProfiles
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: TLSpacing.lg,
          left: TLSpacing.lg,
          right: context.rightPadding + TLSpacing.lg,
          bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TLText(
              text: translations.usersDescription,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors.usersDescription
              )
            ),
            const Gap(TLSpacing.xl),
            Expanded(child: ProfilesTable())
          ]
        )
      )
    );
  }
}