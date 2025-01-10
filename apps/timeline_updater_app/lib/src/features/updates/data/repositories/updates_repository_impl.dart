import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/data/dto/update_dto.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_entity.dart';
import 'package:timeline_updater_app/src/features/updates/data/datasources/updates_datasource.dart';
import 'package:timeline_updater_app/src/features/updates/domain/repositories/updates_repository.dart';

/// An implementation of the updates repository
class UpdatesRepositoryImpl implements UpdatesRepository {

  /// The updates datasource
  final UpdatesDatasource _updatesDatasource;

  /// Default constructor
  const UpdatesRepositoryImpl({
    required UpdatesDatasource updatesDatasource
  })  : _updatesDatasource = updatesDatasource;

  @override
  FutureResult<List<UpdateEntity>, Object> getUpdates({
    required int offset
  }) async {
    try {
      final List<UpdateDto> updateDtos = await _updatesDatasource.getUpdates(offset: offset);
      final List<UpdateEntity> updateEntities = updateDtos.map((UpdateDto dto) => dto.toEntity()).toList();
      return Success(data: updateEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }
}