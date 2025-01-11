import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/customer_mandant_entity.dart';
import 'package:timeline_updater_app/src/features/updates/data/dto/update_file_dto.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_file_entity.dart';
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

  @override
  FutureResult<List<CustomerMandantEntity>, Object> getCustomerMandants({
    required int offset
  }) async {
    try {
      final List<CustomerMandantDto> customerMandantDtos = await _updatesDatasource.getCustomerMandants(offset: offset);
      final List<CustomerMandantEntity> customerMandantEntities = customerMandantDtos.map((CustomerMandantDto dto) => dto.toEntity()).toList();
      return Success(data: customerMandantEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<String, Object> createUpdate({
    required String customerId,
    required String customerMandantId,
    required DateTime timedAt,
    required String title,
    required String releaseNotes,
    required List<UpdateFileEntity> updateFiles
  }) async {
    try {
      final List<UpdateFileDto> updateFileDtos = updateFiles.map((UpdateFileEntity entity) => UpdateFileDto.fromEntity(entity)).toList();
      final String customerMandantUpdateId = await _updatesDatasource.createUpdate(
        customerId: customerId, 
        customerMandantId: customerMandantId, 
        timedAt: timedAt, 
        title: title, 
        releaseNotes: releaseNotes, 
        updateFiles: updateFileDtos
      );
      return Success(data: customerMandantUpdateId);
    } catch (e) {
      return Failure(error: e);
    }
  }
}