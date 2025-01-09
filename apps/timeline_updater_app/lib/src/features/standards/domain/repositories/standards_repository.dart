import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/data/datasource/standards_datasource.dart';
import 'package:timeline_updater_app/src/features/standards/data/repositories/standards_repository_impl.dart';
import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';

part 'standards_repository.g.dart';

/// The repository for standards
@riverpod
StandardsRepository standardsRepository(Ref ref) {
  return StandardsRepositoryImpl(
    standardsDatasource: ref.read(standardsDatasourceProvider)
  );
}

/// An interface for the standards repository
abstract interface class StandardsRepository {

  /// Gets all standards
  FutureResult<List<StandardEntity>, Object> getStandards({
    required int offset
  });

  /// Uploads a new standard kit
  FutureResult<void, Object> uploadStandard({
    required File standardFile,
    required StandardType type,
    required StandardEvolution evolution,
    required StandardVersion version,
    StandardFlavor? flavor,
    required DateTime patch
  });
}