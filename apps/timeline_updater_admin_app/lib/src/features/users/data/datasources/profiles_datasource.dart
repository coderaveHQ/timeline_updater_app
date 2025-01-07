import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/users/data/datasources/profiles_datasource_impl.dart';
import 'package:timeline_updater_admin_app/src/features/users/data/dto/profile_dto.dart';

part 'profiles_datasource.g.dart';

/// A datasource for profiles
@riverpod
ProfilesDatasource profilesDatasource(Ref ref) {
  return ProfilesDatasourceImpl();
}

/// An interface for the profiles datasource
abstract interface class ProfilesDatasource {
  
  /// Default constructor
  const ProfilesDatasource();

  /// Gets all profiles
  Future<List<ProfileDto>> getProfiles({
    required int offset
  });
}