import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/core/utils/custom_toasts.dart';
import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_file_entity.dart';
import 'package:timeline_updater_app/src/features/updates/presentation/app/create_update_page_state_notifier.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_app/src/features/updates/presentation/widgets/create_update_page_section.dart';
import 'package:timeline_updater_app/src/features/updates/presentation/widgets/customer_mandants_table.dart';

/// A page for creating a new update
class CreateUpdatePage extends StatefulHookConsumerWidget {

  /// Default constructor
  const CreateUpdatePage({ super.key });

  @override
  ConsumerState<CreateUpdatePage> createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends ConsumerState<CreateUpdatePage> {

  late TextEditingController _titleController;
  late TextEditingController _releaseNotesController;
  late TabController _tabController;

  void _handleAddSqlFiles(List<File> files) {
    ref.read(createUpdatePageStateNotifierProvider.notifier).addFiles(files, type: UpdateFileType.sql);
  }

  void _handleAddDllFiles(List<File> files) {
    ref.read(createUpdatePageStateNotifierProvider.notifier).addFiles(files, type: UpdateFileType.dynamicAssembly);
  }

  void _handleAddTlcFiles(List<File> files) {
    ref.read(createUpdatePageStateNotifierProvider.notifier).addFiles(files, type: UpdateFileType.customization);
  }

  void _handleChangeTimedAt(DateTime newTime) {
    ref.read(createUpdatePageStateNotifierProvider.notifier).changeTimedAt(newTime);
  }

  Future<void> _onSelectFiles(UpdateFileType type) async {
    await ref.read(createUpdatePageStateNotifierProvider.notifier).selectFiles(type);
  }

  Future<void> _handleCreateUpdate() async {
    final String title = _titleController.text.trim();
    final String releaseNotes = _releaseNotesController.text.trim();

    final String? customerMandantUpdateId = await ref.read(createUpdatePageStateNotifierProvider.notifier).createUpdate(
      title: title,
      releaseNotes: releaseNotes
    );

    if (mounted && customerMandantUpdateId != null) {
      // TODO: Navigate to update details page
      CustomSuccessToasts().updateCreated.show(context);
      context.pop();
    }
  }

  void _handleCreateUpdatePageStateUpdate(CreateUpdatePageState? last, CreateUpdatePageState next) {
    if (next.error != null) next.error!.showErrorToast(context);
  }
  
  @override
  Widget build(BuildContext context) {

    _titleController = useTextEditingController();
    _releaseNotesController = useTextEditingController();
    _tabController = useTabController(initialLength: 3);

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final CreateUpdatePageState pageState = ref.watch(createUpdatePageStateNotifierProvider);

    ref.listen(createUpdatePageStateNotifierProvider, _handleCreateUpdatePageStateUpdate);

    return TLScaffold(
      appBar: TLAppBar(
        context: context,
        title: translations.createUpdateAppBarTitle,
        backButton: TLAppBarBackButton(isEnabled: !pageState.isLoading)
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: TLSpacing.lg,
          left: context.leftPadding + TLSpacing.lg,
          right: context.rightPadding + TLSpacing.lg
        ),
        child: Column(
          children: [
            CreateUpdatePageSection(
              title: translations.createUpdateMandantSectionTitle, 
              child: SizedBox(
                height: 200.0,
                child: CustomerMandantsTable()
              )
            ),
            const Gap(TLSpacing.lg),
            CreateUpdatePageSection(
              title: translations.createUpdateFilesSectionTitle, 
              child: TLTabBar(
                controller: _tabController,
                titles: [
                  translations.createUpdateFilesSqlsTabBarTitle,
                  translations.createUpdateFilesDynamicAssembliesTabBarTitle,
                  translations.createUpdateFilesCustomizationTabBarTitle
                ]
              )
            ),
            const Gap(TLSpacing.lg),
            SizedBox(
              height: 150.0 + TLSpacing.md + 14.0 + 14.0,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TLText(
                            text: translations.createUpdateSelectedFilesTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: colors.createUpdateSelectedFilesText
                            )
                          ),
                          const Gap(TLSpacing.md),
                          if (pageState.sqlFiles.isNotEmpty) Expanded(
                            child: TLText(
                              text: pageState.sqlFiles.map((UpdateFileEntity updateFile) => updateFile.file.fileName).join(', '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: colors.createUpdateSelectedFileNames
                              )
                            )
                          )
                        ]
                      ),
                      const Gap(TLSpacing.md),
                      TLDropZone(
                        height: 150.0,
                        isEnabled: !pageState.isLoading,
                        clickableText: translations.createUpdateFilesSqlDropZoneClickableText,
                        otherText: translations.createUpdateFilesSqlDropZoneOtherText,
                        onFilesDropped: _handleAddSqlFiles,
                        onPressed: () => _onSelectFiles(UpdateFileType.sql)
                      )
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TLText(
                            text: translations.createUpdateSelectedFilesTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: colors.createUpdateSelectedFilesText
                            )
                          ),
                          const Gap(TLSpacing.md),
                          if (pageState.dllFiles.isNotEmpty) Expanded(
                            child: TLText(
                              text: pageState.dllFiles.map((UpdateFileEntity updateFile) => updateFile.file.fileName).join(', '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: colors.createUpdateSelectedFileNames
                              )
                            )
                          )
                        ]
                      ),
                      const Gap(TLSpacing.md),
                      TLDropZone(
                        height: 150.0,
                        isEnabled: !pageState.isLoading,
                        clickableText: translations.createUpdateFilesDynamicAssembliesDropZoneClickableText,
                        otherText: translations.createUpdateFilesDynamicAssembliesDropZoneOtherText,
                        onFilesDropped: _handleAddDllFiles,
                        onPressed: () => _onSelectFiles(UpdateFileType.dynamicAssembly)
                      )
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TLText(
                            text: translations.createUpdateSelectedFilesTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: colors.createUpdateSelectedFilesText
                            )
                          ),
                          const Gap(TLSpacing.md),
                          if (pageState.tlcFiles.isNotEmpty) Expanded(
                            child: TLText(
                              text: pageState.tlcFiles.map((UpdateFileEntity updateFile) => updateFile.file.fileName).join(', '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: colors.createUpdateSelectedFileNames
                              )
                            )
                          )
                        ]
                      ),
                      const Gap(TLSpacing.md),
                      TLDropZone(
                        height: 150.0,
                        isEnabled: !pageState.isLoading,
                        clickableText: translations.createUpdateFilesCustomizationDropZoneClickableText,
                        otherText: translations.createUpdateFilesCustomizationDropZoneOtherText,
                        onFilesDropped: _handleAddTlcFiles,
                        onPressed: () => _onSelectFiles(UpdateFileType.customization)
                      )
                    ]
                  )
                ]
              )
            ),
            const Gap(TLSpacing.lg),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg),
                child: Column(
                  children: [
                    CreateUpdatePageSection(
                      title: translations.createUpdateTitleSectionTitle,
                      child: TLTextField(
                        controller: _titleController,
                        icon: LucideIcons.tag,
                        hint: translations.createUpdateTitleTextFieldHint,
                        isEnabled: !pageState.isLoading
                      )
                    ),
                    const Gap(TLSpacing.lg),
                    CreateUpdatePageSection(
                      title: translations.createUpdateReleaseNotesSectionTitle, 
                      child: TLTextField.multiline(
                        controller: _releaseNotesController,
                        icon: LucideIcons.letterText,
                        hint: translations.createUpdateReleaseNotesTextFieldHint,
                        isEnabled: !pageState.isLoading
                      )
                    ),
                    const Gap(TLSpacing.lg),
                    CreateUpdatePageSection(
                      title: translations.createUpdateTimingSectionTitle, 
                      child: TLDateTimePickerField(
                        isEnabled: !pageState.isLoading,
                        type: DateTimeType.dateAndTime,
                        initial: DateTime.now(),
                        current: pageState.timedAt,
                        emptyText: translations.createUpdateEmptyTimingText,
                        onChanged: _handleChangeTimedAt
                      )
                    ),
                    const Gap(TLSpacing.lg),
                    TLRectangleButton(
                      onPressed: _handleCreateUpdate,
                      title: translations.createUpdateCreateUpdateButtonTitle,
                      isEnabled: !pageState.isLoading,
                      isLoading: pageState.isLoading
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}