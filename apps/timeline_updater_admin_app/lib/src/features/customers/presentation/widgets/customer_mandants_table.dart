import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/app/customer_mandants_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// Displays a paginated table of customer mandants
class CustomerMandantsTable extends ConsumerWidget {

  /// The id of the customer
  final String customerId;

  /// Default constructor
  const CustomerMandantsTable({
    super.key,
    required this.customerId
  });

  void _handleCustomerMandantsTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<CustomerMandantEntity>>? last, AsyncValue<OffsetPaginationData<CustomerMandantEntity>> next) {
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
          title: translations.customerDetailsMandantsTableIdColumnTitle,
          width: 350.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsMandantsTableNameColumnTitle,
          width: 250.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsMandantsTableCreatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.customerDetailsMandantsTableUpdatedAtColumnTitle,
          width: 200.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, CustomerMandantEntity? customerMandant) {
    return TLTableRow(
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : customerMandant!.id),
        TLTableCellText(text: isSkeleton ? 'tlcw_demo' : customerMandant!.name),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customerMandant!.createdAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customerMandant!.updatedAt).toHumanReadable(context, DateTimeType.dateAndTime))
      ]
    );
  }

  Future<void> _handleCreateCustomerMandant(BuildContext context) async {
    // TODO
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(customerMandantsTableStateNotifierProvider(customerId), (AsyncValue<OffsetPaginationData<CustomerMandantEntity>>? last, AsyncValue<OffsetPaginationData<CustomerMandantEntity>> next) => _handleCustomerMandantsTableStateUpdate(context, last, next));

    return TLTable(
      provider: customerMandantsTableStateNotifierProvider(customerId), 
      futureRefreshable: customerMandantsTableStateNotifierProvider(customerId).future, 
      notifierRefreshable: customerMandantsTableStateNotifierProvider(customerId).notifier,
      title: translations.customerDetailsMandantsTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.customerDetailsMandantsTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, CustomerMandantEntity? customerMandant) => _tableRow(context, isSkeleton, customerMandant),
      actionButton: TLTableButton(
        onPressed: () => _handleCreateCustomerMandant(context),
        icon: LucideIcons.plus,
        title: translations.customerDetailsMandantsTableCreateCustomerButtonTitle
      )
    );
  }
}