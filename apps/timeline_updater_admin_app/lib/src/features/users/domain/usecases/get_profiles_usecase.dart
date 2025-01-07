import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/repositories/profiles_repository.dart';

part 'get_profiles_usecase.g.dart';

/// A provider for the `GetProfilesUsecase`
@riverpod
GetProfilesUsecase getProfilesUsecase(Ref ref) {
  return GetProfilesUsecase(
    profilesRepository: ref.read(profilesRepositoryProvider)
  );
}

/// A usecase for getting profiles
class GetProfilesUsecase extends FutureUsecaseWithParams<List<ProfileEntity>, Object, GetProfilesUsecaseParams> {
  
  /// The profiles repository to be used
  final ProfilesRepository _profilesRepository;

  /// Default constructor
  const GetProfilesUsecase({
    required ProfilesRepository profilesRepository
  })  : _profilesRepository = profilesRepository;

  @override
  FutureResult<List<ProfileEntity>, Object> call(GetProfilesUsecaseParams params) async {
    return await _profilesRepository.getProfiles(offset: params.offset);
  }
}

/// Parameters needed for the `GetProfilesUsecase`
class GetProfilesUsecaseParams {

  /// The current offset
  final int offset;

  /// Default constructor
  const GetProfilesUsecaseParams({ 
    required this.offset
  });
}