import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/core/utils/env.dart';
import 'package:timeline_updater_admin_app/src/features/users/data/dto/profile_dto.dart';
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
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String serviceKey
  }) async {
    final UserResponse _ = await SupabaseClient(Env.supabaseUrl, serviceKey).auth.admin.createUser(
      AdminUserAttributes(
        email: email,
        password: password,
        emailConfirm: true,
        userMetadata: <String, dynamic>{
          'type' : UserType.admin.dbValue, // TODO
          'name' : name
        }
      )
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