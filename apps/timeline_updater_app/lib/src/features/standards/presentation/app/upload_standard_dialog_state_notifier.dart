import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/domain/usecases/upload_standard_usecase.dart';

part 'upload_standard_dialog_state_notifier.g.dart';

/// A state notifier for the upload standard dialog
@riverpod
class UploadStandardDialogStateNotifier extends _$UploadStandardDialogStateNotifier {

  @override
  UploadStandardDialogState build() => UploadStandardDialogState.initial();

  /// Selects a file from the users device
  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final File file = File(result.files.single.path!);
    changeFile(file);
  }

  /// Changes the file selected
  void changeFile(File file) {
    state = state.copyWith(
      file: file,
      removeError: true
    );
  }

  /// Changes the standard type selected
  void changeType(StandardType type) {
    state = state.copyWith(
      type: type,
      removeError: true
    );
  }

  /// Changes the standard evolution selected
  void changeEvolution(StandardEvolution evolution) {
    state = state.copyWith(
      evolution: evolution,
      removeError: true
    );
  }

  /// Changes the standard version selected
  void changeVersion(StandardVersion version) {
    state = state.copyWith(
      version: version,
      removeError: true
    );
  }

  /// Changes the standard flavor selected
  void changeFlavor(StandardFlavor flavor) {
    state = state.copyWith(
      flavor: flavor,
      removeError: true
    );
  }

  /// Changes the patch date selected
  void changePatch(DateTime patch) {
    state = state.copyWith(
      patch: patch,
      removeError: true
    );
  }

  /// Uploads the selected data as a new standard kit
  Future<bool> uploadStandard() async {
    state = state.copyWith(
      isLoading: true,
      removeError: true
    );

    try {
      Validator.validateStandardFile(state.file);

      final UploadStandardUsecaseParams params = UploadStandardUsecaseParams(
        standardFile: state.file!,
        type: state.type,
        evolution: state.evolution,
        version: state.version,
        flavor: state.type == StandardType.client ? state.flavor : null,
        patch: state.patch
      );
      
      final Result<void, Object> result = await ref.read(uploadStandardUsecaseProvider).call(params);

      result.fold<void>(
        onSuccess: (void _) => state = state.copyWith(isLoading: false),
        onFailure: (Object error) => throw error
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e
      );
    }

    return state.error == null;
  }
}

/// The state of the upload standard dialog
class UploadStandardDialogState {

  /// The actual file to be uploaded
  final File? file;

  /// The standard type of the file
  final StandardType type;

  /// The standard evolution of the file
  final StandardEvolution evolution;

  /// The standard version of the file
  final StandardVersion version;

  /// The standard flavor of the file
  /// This will be set even if is of type server 
  /// but will not be used and removed from the UI then
  final StandardFlavor flavor;

  /// The patch date of the file
  final DateTime patch;

  /// Wether the upload process is currently ongoing
  final bool isLoading;

  /// An error thrown while uploading
  final Object? error;

  /// Default constructor
  const UploadStandardDialogState({
    this.file,
    required this.type,
    required this.evolution,
    required this.version,
    required this.flavor,
    required this.patch,
    this.isLoading = false,
    this.error
  });

  /// Constructor for the initial state
  UploadStandardDialogState.initial()
    : file = null,
      type = StandardType.client,
      evolution = StandardEvolution.e3,
      version = StandardVersion.v15,
      flavor = StandardFlavor.enterprise,
      patch = DateTime.now(),
      isLoading = false,
      error = null;

  /// Copies the current state but with some other values
  UploadStandardDialogState copyWith({
    File? file,
    StandardType? type,
    StandardEvolution? evolution,
    StandardVersion? version,
    StandardFlavor? flavor,
    DateTime? patch,
    bool? isLoading,
    Object? error,
    bool removeError = false
  }) {
    return UploadStandardDialogState(
      file: file ?? this.file,
      type: type ?? this.type,
      evolution: evolution ?? this.evolution,
      version: version ?? this.version,
      flavor: flavor ?? this.flavor,
      patch: patch ?? this.patch,
      isLoading: isLoading ?? this.isLoading,
      error: removeError ? null : error ?? this.error
    );
  }
}