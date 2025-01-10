import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/presentation/app/updates_table_state_notifier.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_entity.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';

/// Displays a paginated table of updates
class UpdatesTable extends ConsumerWidget {

  /// Default constructor
  const UpdatesTable({ super.key });

  void _handleUpdatesTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<UpdateEntity>>? last, AsyncValue<OffsetPaginationData<UpdateEntity>> next) {
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
          title: translations.updatesTableIdColumnTitle,
          width: 350.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableCreatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableUpdatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableCustomerNameColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableMandantNameColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableTimedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableStatusColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.updatesTableTitleColumnTitle,
          width: 200.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, UpdateEntity? update) {
    return TLTableRow(
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : update!.id),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : update!.createdAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : update!.updatedAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellText(text: isSkeleton ? 'Heinz Hesse KG' : update!.customerName),
        TLTableCellText(text: isSkeleton ? 'hesse_live' : update!.mandantName),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : update!.timedAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? UpdateStatus.success : update!.status).title(context),
            backgroundColor: (isSkeleton ? UpdateStatus.success : update!.status).color(context),
            foregroundColor: TLColors.white
          )
        ),
        TLTableCellText(text: isSkeleton ? 'Anpassungen 2024-12-02' : update!.title)
      ]
    );
  }

  Future<void> _handleCreateUpdate(BuildContext context) async {
    // TODO
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(updatesTableStateNotifierProvider, (AsyncValue<OffsetPaginationData<UpdateEntity>>? last, AsyncValue<OffsetPaginationData<UpdateEntity>> next) => _handleUpdatesTableStateUpdate(context, last, next));

    return TLTable(
      provider: updatesTableStateNotifierProvider, 
      futureRefreshable: updatesTableStateNotifierProvider.future, 
      notifierRefreshable: updatesTableStateNotifierProvider.notifier,
      title: translations.updatesTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.updatesTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, UpdateEntity? update) => _tableRow(context, isSkeleton, update),
      actionButton: TLTableButton(
        onPressed: () => _handleCreateUpdate(context),
        icon: LucideIcons.plus,
        title: translations.updatesTableCreateUpdateButtonTitle
      )
    );
  }
}