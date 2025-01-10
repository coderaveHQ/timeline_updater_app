import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/data/dto/update_dto.dart';
import 'package:timeline_updater_app/src/features/updates/data/datasources/updates_datasource.dart';

/// An implementation of the updates datasource
class UpdatesDatasourceImpl implements UpdatesDatasource {

  /// Default constructor
  const UpdatesDatasourceImpl();

  @override
  Future<List<UpdateDto>> getUpdates({
    required int offset
  }) async {
    final List<Json> updateRows = await Supabase.instance.client.rpc('app_get_updates', params: <String, dynamic>{
      'in_offset' : offset
    });
    return updateRows.map((Json updateRow) => UpdateDto.fromJson(updateRow)).toList();
  }
}