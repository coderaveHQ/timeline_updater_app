import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_customer_app/src/features/updates/data/datasources/updates_datasource_impl.dart';
import 'package:timeline_updater_customer_app/src/features/updates/data/dto/update_dto.dart';

part 'updates_datasource.g.dart';

/// A datasource for updates
@riverpod
UpdatesDatasource updatesDatasource(Ref ref) {
  return UpdatesDatasourceImpl();
}

/// An interface for the updates datasource
abstract interface class UpdatesDatasource {
  
  /// Default constructor
  const UpdatesDatasource();

  /// Gets all updates
  Future<List<UpdateDto>> getUpdates({
    required int offset
  });
}