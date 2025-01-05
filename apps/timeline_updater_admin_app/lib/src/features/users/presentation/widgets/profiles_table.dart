import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/users/presentation/app/profiles_table_state_notifier.dart';

/// Displays a paginated table of profiles
class ProfilesTable extends ConsumerWidget {

  /// Default constructor
  const ProfilesTable({ super.key });

  void _handleProfilesTableStateUpdate(BuildContext context, AsyncValue<OffsetPaginationData<ProfileEntity>>? last, AsyncValue<OffsetPaginationData<ProfileEntity>> next) {
    if (next.hasError && !next.isLoading) next.showErrorToast(context);
  }

  double _tableWidth(BuildContext context) {
    final bool isExpanded = context.screenWidth >= TLUIConstants.navigationRailBreakPoint;
    final double navigationRailWidth = context.leftPadding + 2 * TLSpacing.sm + (isExpanded ? 280.0 : 40.0);
    return context.screenWidth - navigationRailWidth - 2 * TLSpacing.lg - context.rightPadding;
  }

  TLTableHeader _tableHeader(CustomLocalizable translations) {
    return TLTableHeader(
      items: <TLTableHeaderItem>[ // TODO localization
        TLTableHeaderItem(
          title: 'ID',
          width: 350.0
        ),
        TLTableHeaderItem(
          title: 'Name',
          width: 250.0
        ),
        TLTableHeaderItem(
          title: 'Erstellt',
          width: 200.0
        ),
        TLTableHeaderItem(
          title: 'Zuletzt bearbeitet',
          width: 200.0
        ),
        TLTableHeaderItem(
          title: 'Typ',
          width: 150.0
        )
      ]
    );
  }

  TLTableRow _tableRow(BuildContext context, bool isSkeleton, ProfileEntity? profile) {
    return TLTableRow(
      cells: <Widget>[
        TLTableCellText(text: isSkeleton ? '3c0f378b-39d0-4847-b02c-a7077fa22439' : profile!.id),
        TLTableCellText(text: isSkeleton ? 'Florian Leeser' : profile!.name),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : profile!.createdAt).toHumanReadable(context)),
        TLTableCellText(text: (isSkeleton ? DateTime.now() : profile!.updatedAt).toHumanReadable(context)),
        TLTableCellChip(
          chip: TLChip.basic(
            title: (isSkeleton ? UserType.admin : profile!.type).title(context),
            backgroundColor: (isSkeleton ? UserType.admin : profile!.type).color(context),
            foregroundColor: TLColors.white
          )
        )
      ]
    );
  }

  Future<void> _handleCreateUser() async {
    // TODO
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    ref.listen(profilesTableStateNotifierProvider, (AsyncValue<OffsetPaginationData<ProfileEntity>>? last, AsyncValue<OffsetPaginationData<ProfileEntity>> next) => _handleProfilesTableStateUpdate(context, last, next));

    return TLTable(
      provider: profilesTableStateNotifierProvider, 
      futureRefreshable: profilesTableStateNotifierProvider.future, 
      notifierRefreshable: profilesTableStateNotifierProvider.notifier,
      title: translations.usersProfilesTableTitle,
      tableWidth: _tableWidth(context),
      emptyText: translations.usersProfilesTableEmpty,
      header: _tableHeader(translations),
      dataRowBuilder: (bool isSkeleton, ProfileEntity? profile) => _tableRow(context, isSkeleton, profile),
      actionButton: TLTableButton(
        onPressed: _handleCreateUser,
        icon: LucideIcons.plus,
        title: translations.usersProfilesTableCreateUserButtonTitle
      )
    );
  }
}