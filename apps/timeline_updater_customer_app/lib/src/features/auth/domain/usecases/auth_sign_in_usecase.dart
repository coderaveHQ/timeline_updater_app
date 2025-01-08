import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_customer_app/src/features/auth/domain/repositories/auth_repository.dart';

part 'auth_sign_in_usecase.g.dart';

/// A provider for the `SignInUsecase`
@riverpod
AuthSignInUsecase authSignInUsecase(Ref ref) {
  return AuthSignInUsecase(
    authRepository: ref.read(authRepositoryProvider)
  );
}

/// A usecase for the sign in process
class AuthSignInUsecase extends FutureUsecaseWithParams<void, Object, AuthSignInUsecaseParams> {
  
  /// The auth repository to be used
  final AuthRepository _authRepository;

  /// Default constructor
  const AuthSignInUsecase({
    required AuthRepository authRepository
  })  : _authRepository = authRepository;

  @override
  FutureResult<void, Object> call(AuthSignInUsecaseParams params) async {
    return await _authRepository.signIn(
      email: params.email,
      password: params.password
    );
  }
}

/// Parameters needed for the sign in usecase
class AuthSignInUsecaseParams {

  /// The email of the user
  final String email;

  /// The password of the user
  final String password;

  /// Default constructor
  const AuthSignInUsecaseParams({ 
    required this.email,
    required this.password 
  });
}