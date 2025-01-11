import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/update_file_entity.dart';
import 'package:timeline_updater_app/src/features/updates/domain/repositories/updates_repository.dart';

part 'create_update_usecase.g.dart';

/// A provider for the `CreateUpdateUsecase`
@riverpod
CreateUpdateUsecase createUpdateUsecase(Ref ref) {
  return CreateUpdateUsecase(
    updatesRepository: ref.read(updatesRepositoryProvider)
  );
}

/// A usecase for getting updates
class CreateUpdateUsecase extends FutureUsecaseWithParams<String, Object, CreateUpdateUsecaseParams> {
  
  /// The updates repository to be used
  final UpdatesRepository _updatesRepository;

  /// Default constructor
  const CreateUpdateUsecase({
    required UpdatesRepository updatesRepository
  })  : _updatesRepository = updatesRepository;

  @override
  FutureResult<String, Object> call(CreateUpdateUsecaseParams params) async {
    return await _updatesRepository.createUpdate(
      customerId: params.customerId, 
      customerMandantId: params.customerMandantId,
      timedAt: params.timedAt, 
      title: params.title, 
      releaseNotes: params.releaseNotes, 
      updateFiles: params.updateFiles
    );
  }
}

/// Parameters needed for the `CreateUpdateUsecase`
class CreateUpdateUsecaseParams {

  /// The ID of the customer
  final String customerId;
  
  /// The ID of the customers mandnat
  final String customerMandantId;

  /// When the update is timed at
  final DateTime timedAt;

  /// The title of the update
  final String title;

  /// The release notes
  final String releaseNotes;

  /// A list of files to use for the update
  final List<UpdateFileEntity> updateFiles;

  /// Default constructor
  const CreateUpdateUsecaseParams({ 
    required this.customerId,
    required this.customerMandantId,
    required this.timedAt,
    required this.title,
    required this.releaseNotes,
    required this.updateFiles
  });
}