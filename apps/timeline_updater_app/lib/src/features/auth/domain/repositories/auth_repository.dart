import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/auth/domain/entities/profile_entity.dart';
import 'package:timeline_updater_app/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:timeline_updater_app/src/features/auth/data/repositories/auth_repository_impl.dart';

part 'auth_repository.g.dart';

/// The repository for authentication processes
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    authDatasource: ref.read(authDatasourceProvider)
  );
}

/// An interface for the authentication repository
abstract interface class AuthRepository {

  /// Signs in the user
  FutureResult<void, Object> signIn({
    required String email,
    required String password
  });

  /// Signs out the currently signed in user
  FutureResult<void, Object> signOut();

  /// Gets the profile of the currently signed in user
  FutureResult<ProfileEntity, Object> getCurrentProfile();
}