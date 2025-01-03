import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/auth/data/datasources/auth_datasource_impl.dart';

part 'auth_datasource.g.dart';

/// A datasource for authentication processes
@riverpod
AuthDatasource authDatasource(Ref ref) {
  return const AuthDatasourceImpl();
}

/// An interface for the authentication datasource
abstract interface class AuthDatasource {
  
  /// Default constructor
  const AuthDatasource();

  /// Signs in the user based on the given credentials consitsing of `email` and `password`
  Future<void> signIn({
    required String email,
    required String password
  });

  /// Signs out the currently signed in user
  Future<void> signOut();
}