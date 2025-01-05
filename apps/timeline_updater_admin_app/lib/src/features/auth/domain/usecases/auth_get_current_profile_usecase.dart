import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/auth/domain/repositories/auth_repository.dart';

part 'auth_get_current_profile_usecase.g.dart';

/// A provider for the usecase for the get current profile process
@riverpod
AuthGetCurrentProfileUsecase authGetCurrentProfileUsecase(Ref ref) {
  return AuthGetCurrentProfileUsecase(
    authRepository: ref.read(authRepositoryProvider)
  );
}

/// An usecase for the get current profile process
class AuthGetCurrentProfileUsecase extends FutureUsecaseWithoutParams<ProfileEntity, Object> {

  /// The used authentication repository
  final AuthRepository _authRepository;

  /// Default constructor
  const AuthGetCurrentProfileUsecase({
    required AuthRepository authRepository
  }) : _authRepository = authRepository;

  @override
  FutureResult<ProfileEntity, Object> call() async {
    return await _authRepository.getCurrentProfile();
  }
}