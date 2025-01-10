import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/usecases/get_updates_usecase.dart';
import 'package:timeline_updater_app/src/features/updates/domain/entites/update_entity.dart';

part 'updates_table_state_notifier.g.dart';

/// Handles the updates table state
@riverpod
class UpdatesTableStateNotifier extends _$UpdatesTableStateNotifier with OffsetPaginationNotifierMixin<UpdateEntity, Object> {

  @override
  Future<OffsetPaginationData<UpdateEntity>> build() => initialLoad();

  @override
  FutureResult<List<UpdateEntity>, Object> fetch({
    required int offset
  }) async {
    final GetUpdatesUsecaseParams getUpdatesUsecaseParams = GetUpdatesUsecaseParams(offset: offset);
    final GetUpdatesUsecase getUpdatesUsecase = ref.watch(getUpdatesUsecaseProvider);
    return await getUpdatesUsecase.call(getUpdatesUsecaseParams);
  }
}