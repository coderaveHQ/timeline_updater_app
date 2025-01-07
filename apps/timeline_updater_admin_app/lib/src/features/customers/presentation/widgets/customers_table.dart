import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/core/services/router.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/app/customers_table_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// Displays a paginated table of customers
class CustomersTable extends ConsumerWidget {

  /// Default constructor
  const CustomersTable({ super.key });

  void _handleCustomersTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<CustomerEntity>>? last, AsyncValue<OffsetPaginationData<CustomerEntity>> next) {
    if (next.hasError && !next.isLoading) next.showErrorToast(context);
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
          title: translations.customersTableIdColumnTitle,
          width: 350.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableNameColumnTitle,
          width: 250.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableCreatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableUpdatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableEvolutionColumnTitle,
          width: 150.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableVersionColumnTitle,
          width: 150.0
        ),
        TLTableHeaderItem(
          title: translations.customersTableFlavorColumnTitle,
          width: 150.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, CustomerEntity? customer) {
    return TLTableRow(
      onPressed: () => _handleCustomerDetails(context, customer!.id),
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : customer!.id),
        TLTableCellText(text: isSkeleton ? 'Florian Leeser' : customer!.name),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customer!.createdAt).toHumanReadable(context)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : customer!.updatedAt).toHumanReadable(context)),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardEvolution.e3 : customer!.evolution).title(context),
            backgroundColor: (isSkeleton ? StandardEvolution.e3 : customer!.evolution).color(context),
            foregroundColor: TLColors.white
          )
        ),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardVersion.v15 : customer!.version).title(context),
            backgroundColor: (isSkeleton ? StandardVersion.v15 : customer!.version).color(context),
            foregroundColor: TLColors.white
          )
        ),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardFlavor.enterprise : customer!.flavor).title(context),
            backgroundColor: (isSkeleton ? StandardFlavor.enterprise : customer!.flavor).color(context),
            foregroundColor: TLColors.white
          )
        )
      ]
    );
  }

  Future<void> _handleCreateCustomer(BuildContext context) async {
    await const CreateCustomerRoute().push(context);
  }

  Future<void> _handleCustomerDetails(BuildContext context, String id) async {
    await CustomerDetailsRoute(id).push(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(customersTableStateNotifierProvider, (AsyncValue<OffsetPaginationData<CustomerEntity>>? last, AsyncValue<OffsetPaginationData<CustomerEntity>> next) => _handleCustomersTableStateUpdate(context, last, next));

    return TLTable(
      provider: customersTableStateNotifierProvider, 
      futureRefreshable: customersTableStateNotifierProvider.future, 
      notifierRefreshable: customersTableStateNotifierProvider.notifier,
      title: translations.customersTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.customersTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, CustomerEntity? customer) => _tableRow(context, isSkeleton, customer),
      actionButton: TLTableButton(
        onPressed: () => _handleCreateCustomer(context),
        icon: LucideIcons.plus,
        title: translations.customersTableCreateCustomerButtonTitle
      )
    );
  }
}