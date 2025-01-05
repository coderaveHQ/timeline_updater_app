import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/auth/domain/repositories/auth_repository.dart';

part 'auth_create_user_usecase.g.dart';

/// A provider for the `AuthCreateUserUsecase`
@riverpod
AuthCreateUserUsecase authCreateUserUsecase(Ref ref) {
  return AuthCreateUserUsecase(
    authRepository: ref.read(authRepositoryProvider)
  );
}

/// A usecase for the create user process
class AuthCreateUserUsecase extends FutureUsecaseWithParams<void, Object, AuthCreateUserUsecaseParams> {
  
  /// The auth repository to be used
  final AuthRepository _authRepository;

  /// Default constructor
  const AuthCreateUserUsecase({
    required AuthRepository authRepository
  })  : _authRepository = authRepository;

  @override
  FutureResult<void, Object> call(AuthCreateUserUsecaseParams params) async {
    return await _authRepository.createUser(
      name: params.name,
      email: params.email,
      password: params.password,
      serviceKey: params.serviceKey
    );
  }
}

/// Parameters needed for the sign in usecase
class AuthCreateUserUsecaseParams {

  /// The name of the user
  final String name;

  /// The email of the user
  final String email;

  /// The password of the user
  final String password;

  /// The secret service key
  final String serviceKey;

  /// Default constructor
  const AuthCreateUserUsecaseParams({ 
    required this.name,
    required this.email,
    required this.password,
    required this.serviceKey
  });
}