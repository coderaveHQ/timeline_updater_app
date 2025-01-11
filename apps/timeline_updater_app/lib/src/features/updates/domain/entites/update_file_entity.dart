import 'dart:io';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An entity for update files
class UpdateFileEntity {

  /// The file itself
  final File file;
  
  /// The type of update file
  final UpdateFileType type;

  /// Default constructor
  const UpdateFileEntity({
    required this.file,
    required this.type
  });
}