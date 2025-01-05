import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/data/datasources/profiles_datasource.dart';
import 'package:timeline_updater_admin_app/src/features/users/data/dto/profile_dto.dart';

/// An implementation of the profiles datasource
class ProfilesDatasourceImpl implements ProfilesDatasource {

  /// Default constructor
  const ProfilesDatasourceImpl();

  @override
  Future<List<ProfileDto>> getProfiles({
    required int offset
  }) async {
    final List<Json> profileRows = await Supabase.instance.client.rpc('app_get_profiles', params: <String, dynamic>{
      'in_offset' : offset
    });
    return profileRows.map((Json profileRow) => ProfileDto.fromJson(profileRow)).toList();
  }
}