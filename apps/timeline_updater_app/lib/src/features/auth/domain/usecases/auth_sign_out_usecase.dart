import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/auth/domain/repositories/auth_repository.dart';

part 'auth_sign_out_usecase.g.dart';

/// A provider for the usecase for the sign out process
@riverpod
AuthSignOutUsecase authSignOutUsecase(Ref ref) {
  return AuthSignOutUsecase(
    authRepository: ref.read(authRepositoryProvider)
  );
}

/// An usecase for the sign out process
class AuthSignOutUsecase extends FutureUsecaseWithoutParams<void, Object> {

  /// The used authentication repository
  final AuthRepository _authRepository;

  /// Default constructor
  const AuthSignOutUsecase({
    required AuthRepository authRepository
  }) : _authRepository = authRepository;

  @override
  FutureResult<void, Object> call() async {
    return await _authRepository.signOut();
  }
}