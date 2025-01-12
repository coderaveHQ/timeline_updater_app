import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/src/features/customers/presentation/app/customer_mandants_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/app/customer_profiles_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/widgets/customer_mandants_table.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/widgets/customer_profiles_table.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';

/// The page for the customer details
class CustomerDetailsPage extends HookConsumerWidget {

  /// The ID of the customer
  final String id;

  /// Default constructor
  const CustomerDetailsPage({ 
    super.key,
    required this.id
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);
    final TabController tabController = useTabController(initialLength: 3);
    
    return TLScaffold(
      appBar: TLAppBar(
        context: context,
        navigationRailExists: true,
        title: translations.customerDetailsAppBarTitle,
        backButton: const TLAppBarBackButton(),
        actionButtons: [
          TLAppBarButton(
            onPressed: () {
              // TODO Add first one
              ref.read(customerMandantsTableStateNotifierProvider(id).notifier).forceRefresh();
              ref.read(customerProfilesTableStateNotifierProvider(id).notifier).forceRefresh();
            },
            icon: LucideIcons.refreshCw
          )
        ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: TLSpacing.lg,
              left: TLSpacing.lg,
              right: context.rightPadding + TLSpacing.lg
            ),
            child: TLText(
              text: translations.customerDetailsDescription,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors.customerDetailsDescription
              )
            )
          ),
          const Gap(TLSpacing.xl),
          Padding(
            padding: EdgeInsets.only(
              left: TLSpacing.lg,
              right: context.rightPadding + TLSpacing.lg,
              bottom: TLSpacing.lg
            ),
            child: TLTabBar(
              controller: tabController,
              titles: [
                translations.customerDetailsDetailsTabTitle,
                translations.customerDetailsMandantsTabTitle,
                translations.customerDetailsProfilesTabTitle
              ]
            )
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(3, (int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: TLSpacing.lg,
                    right: context.rightPadding + TLSpacing.lg,
                    bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg,
                  ),
                  child: switch (index) {
                    0 => Container(),
                    1 => CustomerMandantsTable(customerId: id),
                    _ => CustomerProfilesTable(customerId: id)
                  }
                );
              })
            )
          )
        ]
      )
    );
  }
}