import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';
import 'package:timeline_updater_app/src/features/standards/domain/repositories/standards_repository.dart';

part 'get_standards_usecase.g.dart';

/// A provider for the `GetStandardsUsecase`
@riverpod
GetStandardsUsecase getStandardsUsecase(Ref ref) {
  return GetStandardsUsecase(
    standardsRepository: ref.read(standardsRepositoryProvider)
  );
}

/// A usecase for getting standards
class GetStandardsUsecase extends FutureUsecaseWithParams<List<StandardEntity>, Object, GetStandardsUsecaseParams> {
  
  /// The standards repository to be used
  final StandardsRepository _standardsRepository;

  /// Default constructor
  const GetStandardsUsecase({
    required StandardsRepository standardsRepository
  })  : _standardsRepository = standardsRepository;

  @override
  FutureResult<List<StandardEntity>, Object> call(GetStandardsUsecaseParams params) async {
    return await _standardsRepository.getStandards(offset: params.offset);
  }
}

/// Parameters needed for the `GetStandardsUsecase`
class GetStandardsUsecaseParams {

  /// The current offset
  final int offset;

  /// Default constructor
  const GetStandardsUsecaseParams({ 
    required this.offset
  });
}