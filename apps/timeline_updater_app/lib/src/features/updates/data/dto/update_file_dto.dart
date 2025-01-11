
import 'dart:io';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/update_file_entity.dart';

/// A DTO for update files
class UpdateFileDto {

  /// The file itself
  final File file;
  
  /// The type of update file
  final UpdateFileType type;

  /// Default constructor
  const UpdateFileDto({
    required this.file,
    required this.type
  });

  /// Factory method to convert `UpdateFileEntity` to `UpdateFileDto`
  factory UpdateFileDto.fromEntity(UpdateFileEntity entity) => UpdateFileDto(
    file: entity.file,
    type: entity.type
  );

  /// Converts the `UpdateFileDto` to `UpdateFileEntity`
  UpdateFileEntity toEntity() => UpdateFileEntity(
    file: file,
    type: type
  );
}