import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/presentation/app/create_update_page_state_notifier.dart';
import 'package:timeline_updater_app/src/features/updates/presentation/app/customer_mandants_table_state_notifier.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/customer_mandant_entity.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';

/// Displays a paginated table of customer mandants
class CustomerMandantsTable extends ConsumerWidget {

  /// Default constructor
  const CustomerMandantsTable({ super.key });

  void _handleCustomerMandantsTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<CustomerMandantEntity>>? last, AsyncValue<OffsetPaginationData<CustomerMandantEntity>> next) {
    if (next.hasError && !next.isLoading) next.error!.showErrorToast(context);
  }

  double _tableWidth(BuildContext context) {
    return context.screenWidth - 2 * TLSpacing.lg - context.rightPadding - context.leftPadding;
  }

  TLTableHeader _tableHeader(CustomLocalizable translations) {
    return TLTableHeader(
      items: <TLTableHeaderItem>[
        TLTableHeaderItem(
          title: translations.customerMandantsTableCustomerNameColumnTitle,
          width: 400.0
        ),
        TLTableHeaderItem(
          title: translations.customerMandantsTableCustomerMandantNameColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.customerMandantsTableCustomerIsSelectedColumnTitle,
          width: 100.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, CustomerMandantEntity? customerMandant, bool isSelected) {
    return TLTableRow(
      onPressed: isSkeleton ? null : () => _handleChangeCustomerMandant(context, customerMandant!.customerId, customerMandant.customerMandantId),
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? 'Heinz Hesse KG' : customerMandant!.customerName),
        TLTableCellText(text: isSkeleton ? 'hesse_live' : customerMandant!.customerMandantName),
        TLTableCellIcon(icon: !isSkeleton && isSelected ? LucideIcons.check : null)
      ]
    );
  }

  void _handleChangeCustomerMandant(BuildContext context, String customerId, String customerMandantId) {
    ProviderScope.containerOf(context).read(createUpdatePageStateNotifierProvider.notifier).changeCustomerMandant(customerId, customerMandantId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(customerMandantsTableStateNotifierProvider, (AsyncValue<OffsetPaginationData<CustomerMandantEntity>>? last, AsyncValue<OffsetPaginationData<CustomerMandantEntity>> next) => _handleCustomerMandantsTableStateUpdate(context, last, next));

    String? selectedCustomerMandantId = ref.watch(createUpdatePageStateNotifierProvider).customerMandantId;

    return TLTable(
      provider: customerMandantsTableStateNotifierProvider, 
      futureRefreshable: customerMandantsTableStateNotifierProvider.future, 
      notifierRefreshable: customerMandantsTableStateNotifierProvider.notifier,
      title: translations.customerMandantsTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.customerMandantsTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, CustomerMandantEntity? customerMandant) => _tableRow(context, isSkeleton, customerMandant, customerMandant != null && selectedCustomerMandantId == customerMandant.customerMandantId)
    );
  }
}