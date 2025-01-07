import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/data/dto/profile_dto.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/users/data/datasources/profiles_datasource.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/repositories/profiles_repository.dart';

/// An implementation of the profiles repository
class ProfilesRepositoryImpl implements ProfilesRepository {

  /// The profiles datasource
  final ProfilesDatasource _profilesDatasource;

  /// Default constructor
  const ProfilesRepositoryImpl({
    required ProfilesDatasource profilesDatasource
  })  : _profilesDatasource = profilesDatasource;

  @override
  FutureResult<List<ProfileEntity>, Object> getProfiles({
    required int offset
  }) async {
    try {
      final List<ProfileDto> profileDtos = await _profilesDatasource.getProfiles(offset: offset);
      final List<ProfileEntity> profileEntities = profileDtos.map((ProfileDto dto) => dto.toEntity()).toList();
      return Success(data: profileEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }
}