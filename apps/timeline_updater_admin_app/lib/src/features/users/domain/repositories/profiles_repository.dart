import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/data/datasources/profiles_datasource.dart';
import 'package:timeline_updater_admin_app/src/features/users/data/repositories/profiles_repository_impl.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';

part 'profiles_repository.g.dart';

/// The repository for profiles
@riverpod
ProfilesRepository profilesRepository(Ref ref) {
  return ProfilesRepositoryImpl(
    profilesDatasource: ref.read(profilesDatasourceProvider)
  );
}

/// An interface for the profiles repository
abstract interface class ProfilesRepository {

  /// Gets all profiles
  FutureResult<List<ProfileEntity>, Object> getProfiles({
    required int offset
  });
}