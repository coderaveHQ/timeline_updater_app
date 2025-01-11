import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeline_updater_app/src/features/updates/domain/usecases/create_update_usecase.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/update_file_entity.dart';

part 'create_update_page_state_notifier.g.dart';

/// A notifier for the state of the create update page
@riverpod
class CreateUpdatePageStateNotifier extends _$CreateUpdatePageStateNotifier {

  @override
  CreateUpdatePageState build() => CreateUpdatePageState.initial();

  /// Selects files from the users device
  Future<void> selectFiles(UpdateFileType type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final List<File> files = result.files.map((PlatformFile file) => File(file.path!)).toList();
    addFiles(files, type: type);
  }

  /// Adds new files
  void addFiles(List<File> files, { required UpdateFileType type }) {
    final List<UpdateFileEntity> updateFiles = files.map((File file) => UpdateFileEntity(file: file, type: type)).toList();
    state = state.copyWith(
      files: [ ...state.files, ...updateFiles ],
      removeError: true
    );
  }

  /// Updates the selected customers mandant
  void changeCustomerMandant(String customerId, String customerMandantId) {
    state = state.copyWith(
      customerId: customerId,
      customerMandantId: customerMandantId,
      removeError: true
    );
  }

  /// Updates when the update is timed at
  void changeTimedAt(DateTime newTime) {
    state = state.copyWith(
      timedAt: newTime,
      removeError: true
    );
  }

  /// Creates the update
  Future<String?> createUpdate({
    required String title,
    required String releaseNotes
  }) async {
    state = state.copyWith(
      isLoading: true,
      removeError: true
    );

    try {
      // TODO: Validate

      final CreateUpdateUsecaseParams params = CreateUpdateUsecaseParams(
        customerId: state.customerId!,
        customerMandantId: state.customerMandantId!,
        timedAt: state.timedAt,
        title: title,
        releaseNotes: releaseNotes,
        updateFiles: state.files
      );
      
      final Result<String, Object> result = await ref.read(createUpdateUsecaseProvider).call(params);

      return result.fold<String>(
        onSuccess: (String customerId) {
          state = state.copyWith(isLoading: false);
          return customerId;
        },
        onFailure: (Object error) => throw error
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e
      );
      return null;
    }
  }
}

/// A class for the state of the create update page
class CreateUpdatePageState {

  /// The files for the update
  final List<UpdateFileEntity> files;

  /// The customers id
  final String? customerId;

  /// The id of the selected customers mandant
  final String? customerMandantId;

  /// When the update is timed at
  final DateTime timedAt;

  /// Wether the update is in the creation process
  final bool isLoading;

  /// The error occured during the creation of the update
  final Object? error;

  /// Default constructor
  const CreateUpdatePageState({
    this.files = const <UpdateFileEntity>[],
    required this.timedAt,
    this.customerId,
    this.customerMandantId,
    this.isLoading = false,
    this.error
  });

  /// A constructor for the initial state
  CreateUpdatePageState.initial()
    : files = const <UpdateFileEntity>[],
      isLoading = false,
      error = null,
      timedAt = DateTime.now(),
      customerId = null,
      customerMandantId = null;

  /// Makes it possible to copy the current state with some other values
  CreateUpdatePageState copyWith({
    List<UpdateFileEntity>? files,
    String? customerMandantId,
    String? customerId,
    DateTime? timedAt,
    bool? isLoading,
    Object? error,
    bool removeError = false,
    bool removeCustomerMandantId = false,
    bool removeCustomerId = false,
    bool emptyFiles = false
  }) {
    return CreateUpdatePageState(
      files: emptyFiles ? <UpdateFileEntity>[] : files ?? this.files,
      customerId: removeCustomerId ? null : customerId ?? this.customerId,
      customerMandantId: removeCustomerMandantId ? null : customerMandantId ?? this.customerMandantId,
      timedAt: timedAt ?? this.timedAt,
      isLoading: isLoading ?? this.isLoading,
      error: removeError ? null : error ?? this.error
    );
  }

  /// Gets all currently selected files of type SQL
  List<UpdateFileEntity> get sqlFiles => files.where((UpdateFileEntity file) => file.type == UpdateFileType.sql).toList();

  /// Gets all currently selected files of type DLL
  List<UpdateFileEntity> get dllFiles => files.where((UpdateFileEntity file) => file.type == UpdateFileType.dynamicAssembly).toList();

  /// Gets all currently selected files of type TLC
  List<UpdateFileEntity> get tlcFiles => files.where((UpdateFileEntity file) => file.type == UpdateFileType.customization).toList();
}