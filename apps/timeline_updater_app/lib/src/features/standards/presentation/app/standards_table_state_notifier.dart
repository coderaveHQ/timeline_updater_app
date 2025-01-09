import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeline_updater_app/src/features/standards/domain/usecases/get_standards_usecase.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';

part 'standards_table_state_notifier.g.dart';

/// Handles the standards table state
@riverpod
class StandardsTableStateNotifier extends _$StandardsTableStateNotifier with OffsetPaginationNotifierMixin<StandardEntity, Object> {

  @override
  Future<OffsetPaginationData<StandardEntity>> build() => initialLoad();

  @override
  FutureResult<List<StandardEntity>, Object> fetch({
    required int offset
  }) async {
    final GetStandardsUsecaseParams getStandardsUsecaseParams = GetStandardsUsecaseParams(offset: offset);
    final GetStandardsUsecase getStandardsUsecase = ref.watch(getStandardsUsecaseProvider);
    return await getStandardsUsecase.call(getStandardsUsecaseParams);
  }
}