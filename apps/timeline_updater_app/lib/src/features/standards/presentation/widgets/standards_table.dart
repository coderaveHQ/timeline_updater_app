import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/core/services/router.dart';
import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_app/src/features/standards/presentation/app/standards_table_state_notifier.dart';

/// Displays a paginated table of standards
class StandardsTable extends ConsumerWidget {

  /// Default constructor
  const StandardsTable({ super.key });

  void _handleStandardsTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<StandardEntity>>? last, AsyncValue<OffsetPaginationData<StandardEntity>> next) {
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
          title: translations.standardsTableIdColumnTitle,
          width: 350.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableCreatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableUpdatedAtColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableTypeColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableEvolutionColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableVersionColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTableFlavorColumnTitle,
          width: 200.0
        ),
        TLTableHeaderItem(
          title: translations.standardsTablePatchColumnTitle,
          width: 200.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, StandardEntity? standard) {
    return TLTableRow(
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : standard!.id),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : standard!.createdAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : standard!.updatedAt).toHumanReadable(context, DateTimeType.dateAndTime)),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardType.server : standard!.type).title(context),
            backgroundColor: (isSkeleton ? StandardType.server : standard!.type).color(context),
            foregroundColor: TLColors.white
          )
        ),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardEvolution.e3 : standard!.evolution).title(context),
            backgroundColor: (isSkeleton ? StandardEvolution.e3 : standard!.evolution).color(context),
            foregroundColor: TLColors.white
          )
        ),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? StandardVersion.v15 : standard!.version).title(context),
            backgroundColor: (isSkeleton ? StandardVersion.v15 : standard!.version).color(context),
            foregroundColor: TLColors.white
          )
        ),
        isSkeleton || standard!.flavor != null 
          ? TLTableCellChip(
            chip: TLChip.basic(
              title: (isSkeleton ? StandardFlavor.enterprise : standard!.flavor!).title(context),
              backgroundColor: (isSkeleton ? StandardFlavor.enterprise : standard!.flavor!).color(context),
              foregroundColor: TLColors.white
            )
          )
          : const TLTableCellEmpty(),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : standard!.patch).toHumanReadable(context, DateTimeType.date))
      ]
    );
  }

  Future<void> _handleUploadStandard(BuildContext context) async {
    await UploadStandardRoute().push(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(standardsTableStateNotifierProvider, (AsyncValue<OffsetPaginationData<StandardEntity>>? last, AsyncValue<OffsetPaginationData<StandardEntity>> next) => _handleStandardsTableStateUpdate(context, last, next));

    return TLTable(
      provider: standardsTableStateNotifierProvider, 
      futureRefreshable: standardsTableStateNotifierProvider.future, 
      notifierRefreshable: standardsTableStateNotifierProvider.notifier,
      title: translations.standardsTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.standardsTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, StandardEntity? standard) => _tableRow(context, isSkeleton, standard),
      actionButton: TLTableButton(
        onPressed: () => _handleUploadStandard(context),
        icon: LucideIcons.plus,
        title: translations.standardsTableUploadStandardButtonTitle
      )
    );
  }
}