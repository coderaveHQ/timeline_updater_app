import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_app/src/features/updates/data/dto/update_file_dto.dart';
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

  @override
  Future<List<CustomerMandantDto>> getCustomerMandants({
    required int offset
  }) async {
    final List<Json> customerMandantRows = await Supabase.instance.client.rpc('app_get_update_customer_mandants', params: <String, dynamic>{
      'in_offset' : offset
    });
    return customerMandantRows.map((Json customerMandantRow) => CustomerMandantDto.fromJson(customerMandantRow)).toList();
  }

  @override
  Future<String> createUpdate({
    required String customerId,
    required String customerMandantId,
    required DateTime timedAt,
    required String title,
    required String releaseNotes,
    required List<UpdateFileDto> updateFiles
  }) async {
    List<Json> uploadedFiles = <Json>[];

    for (UpdateFileDto updateFile in updateFiles) {
      final String folderName = updateFile.type.storageFolderName;
      final String filePath = await Supabase.instance.client.storage
        .from('customer-files')
        .upload('$customerId/$folderName/${ updateFile.file.fileName }', updateFile.file);
      
      uploadedFiles.add(<String, String>{
        'type' : updateFile.type.dbValue,
        'path' : filePath
      });
    }

    return await Supabase.instance.client.rpc('app_create_update', params: <String, dynamic>{
      'in_customer_mandant_id' : customerMandantId,
      'in_timed_at' : timedAt.toIso8601String(),
      'in_title' : title,
      'in_release_notes' : releaseNotes,
      'in_files' : uploadedFiles
    });
  }
}