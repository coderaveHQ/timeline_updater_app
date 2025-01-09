import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/domain/repositories/standards_repository.dart';

part 'upload_standard_usecase.g.dart';

/// A provider for the `UploadStandardUsecase`
@riverpod
UploadStandardUsecase uploadStandardUsecase(Ref ref) {
  return UploadStandardUsecase(
    standardsRepository: ref.read(standardsRepositoryProvider)
  );
}

/// A usecase for getting standards
class UploadStandardUsecase extends FutureUsecaseWithParams<void, Object, UploadStandardUsecaseParams> {
  
  /// The standards repository to be used
  final StandardsRepository _standardsRepository;

  /// Default constructor
  const UploadStandardUsecase({
    required StandardsRepository standardsRepository
  })  : _standardsRepository = standardsRepository;

  @override
  FutureResult<void, Object> call(UploadStandardUsecaseParams params) async {
    return await _standardsRepository.uploadStandard(
      standardFile: params.standardFile, 
      type: params.type, 
      evolution: params.evolution, 
      version: params.version,
      flavor: params.flavor, 
      patch: params.patch
    );
  }
}

/// Parameters needed for the `UploadStandardUsecase`
class UploadStandardUsecaseParams {

  /// The file to be uploaded
  final File standardFile;

  /// The standard type
  final StandardType type;

  /// The standard evolution
  final StandardEvolution evolution;

  /// The standard version
  final StandardVersion version;

  /// The standard flavor
  final StandardFlavor? flavor;

  /// The standard patch
  final DateTime patch;

  /// Default constructor
  const UploadStandardUsecaseParams({ 
    required this.standardFile,
    required this.type,
    required this.evolution,
    required this.version,
    this.flavor,
    required this.patch
  });
}