import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app/src/features/updates/data/datasources/updates_datasource_impl.dart';
import 'package:timeline_updater_app/src/features/updates/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_app/src/features/updates/data/dto/update_dto.dart';
import 'package:timeline_updater_app/src/features/updates/data/dto/update_file_dto.dart';

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

  /// Gets all customer mandants for a new update
  Future<List<CustomerMandantDto>> getCustomerMandants({
    required int offset
  });

  /// Creates a new update
  Future<String> createUpdate({
    required String customerId,
    required String customerMandantId,
    required DateTime timedAt,
    required String title,
    required String releaseNotes,
    required List<UpdateFileDto> updateFiles
  });
}