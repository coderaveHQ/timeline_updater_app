import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/src/features/standards/presentation/widgets/standards_table.dart';
import 'package:timeline_updater_app/src/features/standards/presentation/app/standards_table_state_notifier.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';

/// The standards page
class StandardsPage extends ConsumerWidget {

  /// Default constructor
  const StandardsPage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);
    
    return TLScaffold(
      appBar: TLAppBar(
        context: context,
        navigationRailExists: true,
        title: translations.standardsAppBarTitle,
        actionButtons: [
          TLAppBarButton(
            onPressed: () => ref.read(standardsTableStateNotifierProvider.notifier).forceRefresh(),
            icon: LucideIcons.refreshCw
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: TLSpacing.lg,
          left: TLSpacing.lg,
          right: context.rightPadding + TLSpacing.lg,
          bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TLText(
              text: translations.standardsDescription,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors.standardsDescription
              )
            ),
            const Gap(TLSpacing.xl),
            Expanded(child: StandardsTable())
          ]
        )
      )
    );
  }
}