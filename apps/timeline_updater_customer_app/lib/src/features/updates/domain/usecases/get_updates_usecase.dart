import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_customer_app/src/features/updates/domain/entites/update_entity.dart';
import 'package:timeline_updater_customer_app/src/features/updates/domain/repositories/updates_repository.dart';

part 'get_updates_usecase.g.dart';

/// A provider for the `GetUpdatesUsecase`
@riverpod
GetUpdatesUsecase getUpdatesUsecase(Ref ref) {
  return GetUpdatesUsecase(
    updatesRepository: ref.read(updatesRepositoryProvider)
  );
}

/// A usecase for getting updates
class GetUpdatesUsecase extends FutureUsecaseWithParams<List<UpdateEntity>, Object, GetUpdatesUsecaseParams> {
  
  /// The updates repository to be used
  final UpdatesRepository _updatesRepository;

  /// Default constructor
  const GetUpdatesUsecase({
    required UpdatesRepository updatesRepository
  })  : _updatesRepository = updatesRepository;

  @override
  FutureResult<List<UpdateEntity>, Object> call(GetUpdatesUsecaseParams params) async {
    return await _updatesRepository.getUpdates(offset: params.offset);
  }
}

/// Parameters needed for the `GetUpdatesUsecase`
class GetUpdatesUsecaseParams {

  /// The current offset
  final int offset;

  /// Default constructor
  const GetUpdatesUsecaseParams({ 
    required this.offset
  });
}