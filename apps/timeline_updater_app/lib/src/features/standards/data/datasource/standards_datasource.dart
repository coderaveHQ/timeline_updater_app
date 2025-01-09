import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/data/datasource/standards_datasource_impl.dart';
import 'package:timeline_updater_app/src/features/standards/data/dto/standard_dto.dart';

part 'standards_datasource.g.dart';

/// A datasource for standards
@riverpod
StandardsDatasource standardsDatasource(Ref ref) {
  return StandardsDatasourceImpl();
}

/// An interface for the customers datasource
abstract interface class StandardsDatasource {
  
  /// Default constructor
  const StandardsDatasource();

  /// Gets all standards
  Future<List<StandardDto>> getStandards({
    required int offset
  });

  /// Uploads a new standard kit
  Future<void> uploadStandard({
    required File standardFile,
    required StandardType type,
    required StandardEvolution evolution,
    required StandardVersion version,
    StandardFlavor? flavor,
    required DateTime patch
  });
}