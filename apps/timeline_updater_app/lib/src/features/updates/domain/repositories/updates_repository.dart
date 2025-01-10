import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/data/repositories/updates_repository_impl.dart';
import 'package:timeline_updater_app/src/features/updates/data/datasources/updates_datasource.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_entity.dart';

part 'updates_repository.g.dart';

/// The repository for updates
@riverpod
UpdatesRepository updatesRepository(Ref ref) {
  return UpdatesRepositoryImpl(
    updatesDatasource: ref.read(updatesDatasourceProvider)
  );
}

/// An interface for the updates repository
abstract interface class UpdatesRepository {

  /// Gets all updates
  FutureResult<List<UpdateEntity>, Object> getUpdates({
    required int offset
  });
}