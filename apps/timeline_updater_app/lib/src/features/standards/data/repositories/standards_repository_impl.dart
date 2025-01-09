import 'dart:io';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/data/dto/standard_dto.dart';
import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';
import 'package:timeline_updater_app/src/features/standards/data/datasource/standards_datasource.dart';
import 'package:timeline_updater_app/src/features/standards/domain/repositories/standards_repository.dart';

/// An implementation of the standards repository
class StandardsRepositoryImpl implements StandardsRepository {

  /// The standards datasource
  final StandardsDatasource _standardsDatasource;

  /// Default constructor
  const StandardsRepositoryImpl({
    required StandardsDatasource standardsDatasource
  })  : _standardsDatasource = standardsDatasource;

  @override
  FutureResult<List<StandardEntity>, Object> getStandards({
    required int offset
  }) async {
    try {
      final List<StandardDto> standardDtos = await _standardsDatasource.getStandards(offset: offset);
      final List<StandardEntity> standardEntities = standardDtos.map((StandardDto dto) => dto.toEntity()).toList();
      return Success(data: standardEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<void, Object> uploadStandard({
    required File standardFile,
    required StandardType type,
    required StandardEvolution evolution,
    required StandardVersion version,
    StandardFlavor? flavor,
    required DateTime patch
  }) async {
    try {
      await _standardsDatasource.uploadStandard(
        standardFile: standardFile, 
        type: type, 
        evolution: evolution, 
        version: version, 
        patch: patch
      );
      return const Success(data: null);
    } catch (e) {
      return Failure(error: e);
    }
  }
}