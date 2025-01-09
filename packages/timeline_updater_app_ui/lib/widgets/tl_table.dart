import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/widgets/tl_rectangle_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_chip.dart';
import 'package:timeline_updater_app_ui/extensions/object_x.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/typography/tl_typography.dart';
import 'package:timeline_updater_app_ui/widgets/tl_icon_button.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom table widget
final class TLTable<D extends PaginationData<I>, I> extends ConsumerWidget {

  /// The provider
  final ProviderListenable<AsyncValue<D>> provider;

  /// The future refreshable of the provider
  final Refreshable<Future<D>> futureRefreshable;

  /// The notifier refreshable of the provider
  final Refreshable<PaginationNotifierMixin<D, I>> notifierRefreshable;

  /// The title of the table
  final String title;

  /// An optional action button above the table
  final TLTableButton? actionButton;
  
  /// The width of the table to allow scrolling horizontally
  final double tableWidth;

  /// The text to be displayed when there are no elements
  final String emptyText;

  /// The header containing all titles
  final TLTableHeader header;

  /// Builds a row based on the data given
  final TLTableRow Function(bool isSekelton, I? item) dataRowBuilder;

  /// Default constructor
  const TLTable({
    super.key,
    required this.provider,
    required this.futureRefreshable,
    required this.notifierRefreshable,
    required this.title,
    this.actionButton,
    required this.tableWidth,
    required this.emptyText,
    required this.header,
    required this.dataRowBuilder
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final TLColorable colors = TLTheme.colorsOf(context);

    final List<double> columnWidths = header.items.map<double>((TLTableHeaderItem item) => item.width).toList();
    final double columnsWidthSum = columnWidths.fold<double>(0, (double p, double c) => p + c);
    final double neededTableWidth = columnsWidthSum + (header.items.length + 1) * TLSpacing.lg;
    
    // Displays a reload button
    final TLIconButton reloadButton = TLIconButton(
      onPressed: () => ref.read(notifierRefreshable).forceRefresh(),
      icon: LucideIcons.refreshCw,
      color: colors.tableReloadIcon
    );

    // Displays a text when there are no items
    final Widget emptyWidget = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TLText(
            text: emptyText,
            alignment: TextAlign.center,
            style: TLTypography.base.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: colors.tableEmptyText
            )
          ),
          const Gap(TLSpacing.lg),
          reloadButton
        ]
      )
    );

    // Builds a skeleton widget
    Widget skeletonWidget(int index) => _TLTableRowWidget(
      row: dataRowBuilder.call(true, null),
      widths: columnWidths
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TLText(
                text: title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: colors.tableTitle
                )
              )
            ),
            if (actionButton != null) Padding(
              padding: EdgeInsets.only(left: TLSpacing.md),
              child: actionButton
            )
          ]
        ),
        const Gap(TLSpacing.xl),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: max(tableWidth, neededTableWidth),
              child: Column(
                children: [
                  header,
                  Expanded(
                    child: ref.watch(provider).whenIgnorableError(
                      skipErrorOnHasValue: true,
                      data: (
                        D data, {
                        required bool hasError,
                        required bool isLoading,
                        required Object? error
                      }) {
                        if (data.items.isNotEmpty) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.items.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == data.items.length) {
                                return switch ((data.hasMore, hasError, isLoading)) {
                                  (true, false, _) => VisibilityDetector(
                                    key: key ?? const Key('EndItem'),
                                    onVisibilityChanged: (VisibilityInfo info) { if (info.visibleFraction > 0.1) ref.read(notifierRefreshable).loadNext(); },
                                    child: Skeletonizer(
                                      enabled: true,
                                      child: skeletonWidget(index)
                                    )
                                  ),
                                  (true, true, false) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: TLSpacing.lg),
                                    child: reloadButton
                                  ),
                                  (true, true, true) => Skeletonizer(
                                    enabled: true,
                                    child: skeletonWidget(index)
                                  ),
                                  _ => const SizedBox.shrink()
                                };
                              }
              
                              return _TLTableRowWidget(
                                row: dataRowBuilder.call(false, data.items[index]),
                                widths: columnWidths
                              );
                            }
                          );
                        }
              
                        return emptyWidget;
                      },
                      loading: () => Skeletonizer(
                        enabled: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) => skeletonWidget(index)
                        )
                      ),
                      error: (Object e, StackTrace s) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TLText(
                              text: e.errorMessage(context),
                              alignment: TextAlign.center,
                              style: TLTypography.base.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: colors.tableErrorText
                              )
                            ),
                            const Gap(TLSpacing.lg),
                            reloadButton
                          ]
                        )
                      )
                    )
                  )
                ]
              )
            )
          )
        )
      ]
    );
  }
}

/// A custom button widget to display above the table
class TLTableButton extends StatelessWidget {

  /// The onPressed callback
  final VoidCallback? onPressed;

  /// Indicates wether the button displays a loading indicator or a title
  final bool isLoading;

  /// Indicates wether the button is enabled
  final bool isEnabled;

  /// The title
  final String title;

  /// The background color
  final Color? backgroundColor;

  /// The foreground color
  final Color? foregroundColor;

  /// An icon to display in front of the title
  final IconData? icon;

  /// Default constructor
  const TLTableButton({ 
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.icon
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return TLRectangleButton(
      onPressed: onPressed,
      isLoading: isLoading,
      isEnabled: isEnabled,
      title: title,
      backgroundColor: backgroundColor ?? colors.tableButtonBackground,
      foregroundColor: foregroundColor ?? colors.tableButtonForeground,
      icon: icon,
      shrink: true
    );
  }
}

/// A custom header widget for the table
class TLTableHeader extends StatelessWidget {

  /// A list of items to be displayed
  final List<TLTableHeaderItem> items;

  /// Default constructor
  const TLTableHeader({ 
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return Container(
      height: 46.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: TLSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: colors.tableHeaderBackground
      ),
      child: Row(
        children: List.generate(items.length, (int index) {
          final TLTableHeaderItem item = items[index];
          return Padding(
            padding: EdgeInsets.only(left: index != 0 ? TLSpacing.lg : 0.0),
            child: item
          );
        })
      )
    );
  }
}

/// A custom header item widget for the table
class TLTableHeaderItem extends StatelessWidget {

  /// The title
  final String title;

  /// A fixed width to allow scrolling horizontally
  final double width;

  /// Default constructor
  const TLTableHeaderItem({ 
    super.key,
    required this.title,
    required this.width
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return SizedBox(
      width: width,
      child: TLText(
        text: title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TLTypography.base.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: colors.tableHeaderTitleForeground
        )
      )
    );
  }
}

/// A class defining a single row
class TLTableRow {

  /// Callback for when the row is pressed
  final void Function()? onPressed;

  /// List of widgets in that row
  final List<Widget> cells;

  /// Default constructor
  const TLTableRow({
    this.onPressed,
    required this.cells
  });
}

/// Builds the row widget
class _TLTableRowWidget extends StatelessWidget {

  /// The row the user passed
  final TLTableRow row;

  /// The widths of the columns
  final List<double> widths;

  /// Default constructor
  const _TLTableRowWidget({ 
    required this.row,
    required this.widths
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TLSpacing.xs),
      child: SizedBox(
        height: 46.0,
        child: RawMaterialButton(
          onPressed: row.onPressed,
          elevation: 0.0,
          focusElevation: 0.0,
          hoverElevation: 0.0,
          disabledElevation: 0.0,
          highlightElevation: 0.0,
          padding: const EdgeInsets.symmetric(horizontal: TLSpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(row.cells.length, (int index) {
              final Widget cell = row.cells[index];
              final double width = widths[index];
              return Padding(
                padding: EdgeInsets.only(left: index != 0 ? TLSpacing.lg : 0.0),
                child: SizedBox(
                  width: width,
                  child: cell
                )
              );
            })
          )
        )
      )
    );
  }
}

/// A cell which displays nothing
class TLTableCellEmpty extends StatelessWidget {

  /// Default constructor
  const TLTableCellEmpty({ super.key });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// A cell which displays simple text
class TLTableCellText extends StatelessWidget {

  /// The actual text
  final String text;

  /// Default constructor
  const TLTableCellText({ 
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return TLText(
      text: text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: colors.tableCellText
      )
    );
  }
}

/// A cell which displays simple chip
class TLTableCellChip extends StatelessWidget {

  /// The actual chip
  final TLChip chip;

  /// Default constructor
  const TLTableCellChip({ 
    super.key,
    required this.chip
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: chip
    );
  }
}