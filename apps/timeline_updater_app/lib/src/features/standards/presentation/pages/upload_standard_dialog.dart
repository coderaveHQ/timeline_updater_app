import 'dart:io';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/core/utils/custom_toasts.dart';
import 'package:timeline_updater_app/src/features/standards/presentation/app/upload_standard_dialog_state_notifier.dart';
import 'package:timeline_updater_app/src/features/standards/presentation/widgets/upload_standard_dialog_section.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';

/// The dialog for uploading standards
class UploadStandardDialog extends ConsumerStatefulWidget {

  /// Default constructor
  const UploadStandardDialog({ 
    super.key
  });

  @override
  ConsumerState<UploadStandardDialog> createState() => _UploadStandardDialogState();
}

class _UploadStandardDialogState extends ConsumerState<UploadStandardDialog> {

  /// Changes the selected type
  void _onTypeChanged(StandardType type) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changeType(type);
  }

  /// Changes the selected evolution
  void _onEvolutionChanged(StandardEvolution evolution) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changeEvolution(evolution);
  }

  /// Changes the selected version
  void _onVersionChanged(StandardVersion version) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changeVersion(version);
  }

  /// Changes the selected flavor
  void _onFlavorChanged(StandardFlavor flavor) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changeFlavor(flavor);
  }

  /// Changes the selected patch
  void _onPatchChanged(DateTime patch) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changePatch(patch);
  }

  /// Selects a new file
  Future<void> _onSelectFile() async {
    await ref.read(uploadStandardDialogStateNotifierProvider.notifier).selectFile();
  }

  /// Changes the file selected
  void _onFileChanged(File file) {
    ref.read(uploadStandardDialogStateNotifierProvider.notifier).changeFile(file);
  }

  /// Uploads the selected data as a new standard kit
  Future<void> _uploadStandard() async {
    final bool uploadSuccess = await ref.read(uploadStandardDialogStateNotifierProvider.notifier).uploadStandard();
    if (uploadSuccess && mounted) {
      CustomSuccessToasts().standardUploaded.show(context);
      context.pop();
    }
  }

  void _handleUploadStandardDialogStateUpdate(UploadStandardDialogState? last, UploadStandardDialogState next) {
    if (next.error != null) next.error!.showErrorToast(context);
  }

  @override
  Widget build(BuildContext context) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final UploadStandardDialogState dialogState = ref.watch(uploadStandardDialogStateNotifierProvider);

    ref.listen(uploadStandardDialogStateNotifierProvider, _handleUploadStandardDialogStateUpdate);
    
    return TLDialog(
      canClose: () => !dialogState.isLoading,
      leadingIcon: LucideIcons.upload,
      title: translations.uploadStandardDialogTitle, 
      description: translations.uploadStandardDialogDescription, 
      actionButton: TLDialogButton(
        onPressed: _uploadStandard,
        icon: LucideIcons.upload,
        isEnabled: !dialogState.isLoading,
        isLoading: dialogState.isLoading,
        title: translations.uploadStandardDialogActionButtonTitle
      ),
      innerPadding: EdgeInsets.symmetric(horizontal: TLSpacing.lg),
      content: [
        UploadStandardDialogSection(
          title: translations.uploadStandardDialogFileSectionTitle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TLText(
                text: dialogState.file?.fileName ?? translations.uploadStandardDialogNoFileSelected,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: dialogState.file != null ? FontWeight.w600 : FontWeight.w400,
                  color: dialogState.file != null ? colors.uploadStandardDialogFileSelectedForeground : colors.uploadStandardDialogNoFileSelectedForeground,
                  fontStyle: dialogState.file == null ? FontStyle.italic : null
                )
              ),
              const Gap(TLSpacing.md),
              TLDropZone(
                onPressed: _onSelectFile,
                onFileDropped: _onFileChanged,
                isEnabled: !dialogState.isLoading,
                clickableText: translations.uploadStandardDialogClickToUploadText, 
                otherText: translations.uploadStandardDialogUseDragAndDropText
              )
            ]
          )
        ),
        const Gap(TLSpacing.xl),
        UploadStandardDialogSection(
          title: translations.uploadStandardDialogTypeSectionTitle,
          child: TLChips(
            chips: List.generate(StandardType.values.length, (int index) {
              final StandardType type = StandardType.values[index];
              final bool isSelected = dialogState.type == type;

              return TLChip.clickable(
                onPressed: () => _onTypeChanged(type),
                title: type.title(context),
                backgroundColor: isSelected ? type.color(context) : colors.uploadStandardDialogUnselectedChipBackground,
                foregroundColor: isSelected ? TLColors.white : colors.uploadStandardDialogUnselectedChipForeground,
                isEnabled: !dialogState.isLoading
              );
            })
          )
        ),
        const Gap(TLSpacing.xl),
        UploadStandardDialogSection(
          title: translations.uploadStandardDialogEvolutionSectionTitle,
          child: TLChips(
            chips: List.generate(StandardEvolution.values.length, (int index) {
              final StandardEvolution evolution = StandardEvolution.values[index];
              final bool isSelected = dialogState.evolution == evolution;

              return TLChip.clickable(
                onPressed: () => _onEvolutionChanged(evolution),
                title: evolution.title(context),
                backgroundColor: isSelected ? evolution.color(context) : colors.uploadStandardDialogUnselectedChipBackground,
                foregroundColor: isSelected ? TLColors.white : colors.uploadStandardDialogUnselectedChipForeground,
                isEnabled: !dialogState.isLoading
              );
            })
          )
        ),
        const Gap(TLSpacing.xl),
        UploadStandardDialogSection(
          title: translations.uploadStandardDialogVersionSectionTitle,
          child: TLChips(
            chips: List.generate(StandardVersion.values.length, (int index) {
              final StandardVersion version = StandardVersion.values[index];
              final bool isSelected = dialogState.version == version;

              return TLChip.clickable(
                onPressed: () => _onVersionChanged(version),
                title: version.title(context),
                backgroundColor: isSelected ? version.color(context) : colors.uploadStandardDialogUnselectedChipBackground,
                foregroundColor: isSelected ? TLColors.white : colors.uploadStandardDialogUnselectedChipForeground,
                isEnabled: !dialogState.isLoading
              );
            })
          )
        ),
        const Gap(TLSpacing.xl),
        if (dialogState.type == StandardType.client) UploadStandardDialogSection(
          title: translations.uploadStandardDialogFlavorSectionTitle,
          child: TLChips(
            chips: List.generate(StandardFlavor.values.length, (int index) {
              final StandardFlavor flavor = StandardFlavor.values[index];
              final bool isSelected = dialogState.flavor == flavor;

              return TLChip.clickable(
                onPressed: () => _onFlavorChanged(flavor),
                title: flavor.title(context),
                backgroundColor: isSelected ? flavor.color(context) : colors.uploadStandardDialogUnselectedChipBackground,
                foregroundColor: isSelected ? TLColors.white : colors.uploadStandardDialogUnselectedChipForeground,
                isEnabled: !dialogState.isLoading
              );
            })
          )
        ),
        if (dialogState.type == StandardType.client) const Gap(TLSpacing.xl),
        UploadStandardDialogSection(
          title: translations.uploadStandardDialogPatchSectionTitle,
          child: TLDateTimePickerField(
            type: DateTimeType.date,
            initial: DateTime.now(),
            maximum: DateTime.now(),
            current: dialogState.patch,
            emptyText: translations.uploadStandardDialogPatchEmpty,
            onChanged: _onPatchChanged
          )
        )
      ]
    );
  }
}