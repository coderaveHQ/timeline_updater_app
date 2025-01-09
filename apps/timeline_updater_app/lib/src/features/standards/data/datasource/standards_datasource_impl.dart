import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/data/dto/standard_dto.dart';
import 'package:timeline_updater_app/src/features/standards/data/datasource/standards_datasource.dart';

/// An implementation of the standards datasource
class StandardsDatasourceImpl implements StandardsDatasource {

  /// Default constructor
  const StandardsDatasourceImpl();

  @override
  Future<List<StandardDto>> getStandards({
    required int offset
  }) async {
    final List<Json> standardRows = await Supabase.instance.client.rpc('app_get_standards', params: <String, dynamic>{
      'in_offset' : offset
    });
    return standardRows.map((Json standardRow) => StandardDto.fromJson(standardRow)).toList();
  }

  @override
  Future<void> uploadStandard({
    required File standardFile,
    required StandardType type,
    required StandardEvolution evolution,
    required StandardVersion version,
    StandardFlavor? flavor,
    required DateTime patch
  }) async {
    final String evolutionFolderName = evolution.storageFolderName;
    final String versionFolderName = version.storageFolderName;
    final String patchFolderName = '${ patch.year.toString().padLeft(4, '0') }-${ patch.month.toString().padLeft(2, '0') }-${ patch.day.toString().padLeft(2, '0') }';

    // Constructs a file name like e.g. client-enterprise
    final String fileNamePrefix = type.storageFileNamePrefix;
    final String fileName = type == StandardType.server ? fileNamePrefix : '$fileNamePrefix-${ flavor!.storageFileName }';

    final String fileExtension = standardFile.fileExtension;

    // Upload the file to the S3 storage
    // Example path: standards/e3/v15/2025-01-09/client-enterprise.msix
    final String filePath = await Supabase.instance.client.storage
      .from('standards')
      .upload('$evolutionFolderName/$versionFolderName/$patchFolderName/$fileName.$fileExtension', standardFile);

    await Supabase.instance.client.rpc(
      'app_create_standard',
      params: <String, dynamic>{
        'in_file_path' : filePath,
        'in_type' : type.dbValue,
        'in_evolution' : evolution.dbValue,
        'in_version' : version.dbValue,
        if (flavor != null) 'in_flavor' : flavor.dbValue,
        'in_patch' : patch.toIso8601String()
      }
    );
  }
}