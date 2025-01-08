import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_customer_app/src/features/auth/data/dto/profile_dto.dart';
import 'package:timeline_updater_customer_app/src/features/auth/data/datasources/auth_datasource.dart';

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

  @override
  Future<ProfileDto> getCurrentProfile() async {
    final List<Json> profileRow = await Supabase.instance.client.rpc('app_get_current_profile');
    return ProfileDto.fromJson(profileRow.first);
  }
}