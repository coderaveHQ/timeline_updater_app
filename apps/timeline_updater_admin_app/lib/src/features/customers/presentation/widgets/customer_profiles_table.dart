import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/presentation/app/customer_profiles_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// Displays a paginated table of customer profiles
class CustomerProfilesTable extends ConsumerWidget {

  /// The id of the customer
  final String customerId;

  /// Default constructor
  const CustomerProfilesTable({
    super.key,
    required this.customerId
  });

  void _handleCustomerProfilesTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<CustomerProfileEntity>>? last, AsyncValue<OffsetPaginationData<CustomerProfileEntity>> next) {
    if (next.hasError && !next.isLoading) next.error!.showErrorToast(context);
  }

  double _tableWidth(BuildContext context) {
    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;
    final double navigationRailWidth = context.leftPadding + 2 * TLSpacing.sm + (isExpanded ? 280.0 : 40.0);
    return context.screenWidth - navigationRailWidth - 2 * TLSpacing.lg - context.rightPadding;
  }

  TLTableHeader _tableHeader(CustomLocalizable translations) {
    return TLTableHeader(
      items: <TLTableHeaderItem>[
        TLTableHeaderItem(
          title: translations.customerDetailsProfilesTableIdColumnTitle,
          width: 350.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsProfilesTableNameColumnTitle,
          width: 250.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsProfilesTableCreatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsProfilesTableUpdatedAtColumnTitle,
          width: 200.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, CustomerProfileEntity? customerProfile) {
    return TLTableRow(
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : customerProfile!.id),
        TLTableCellText(text: isSkeleton ? 'TimeLine Consulting Wuppertal GmbH' : customerProfile!.name),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customerProfile!.createdAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customerProfile!.updatedAt).toHumanReadable(context, DateTimeType.dateAndTime))
      ]
    );
  }

  Future<void> _handleCreateCustomerProfile(BuildContext context) async {
    // TODO
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(customerProfilesTableStateNotifierProvider(customerId), (AsyncValue<OffsetPaginationData<CustomerProfileEntity>>? last, AsyncValue<OffsetPaginationData<CustomerProfileEntity>> next) => _handleCustomerProfilesTableStateUpdate(context, last, next));

    return TLTable(
      provider: customerProfilesTableStateNotifierProvider(customerId), 
      futureRefreshable: customerProfilesTableStateNotifierProvider(customerId).future, 
      notifierRefreshable: customerProfilesTableStateNotifierProvider(customerId).notifier,
      title: translations.customerDetailsProfilesTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.customerDetailsProfilesTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, CustomerProfileEntity? customerProfile) => _tableRow(context, isSkeleton, customerProfile),
      actionButton: TLTableButton(
        onPressed: () => _handleCreateCustomerProfile(context),
        icon: LucideIcons.plus,
        title: translations.customerDetailsProfilesTableCreateCustomerButtonTitle
      )
    );
  }
}