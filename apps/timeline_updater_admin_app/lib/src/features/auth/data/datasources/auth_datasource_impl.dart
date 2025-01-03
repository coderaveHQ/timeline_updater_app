import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_admin_app/src/features/auth/data/datasources/auth_datasource.dart';

/// An implementation of the authentication datasource
class AuthDatasourceImpl implements AuthDatasource {

  /// Default constructor
  const AuthDatasourceImpl();

  @override
  Future<void> signIn({
    required String email,
    required String password
  }) async {
    final AuthResponse _ = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password
    );
  }

  @override
  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}