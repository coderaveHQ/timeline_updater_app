import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/users/domain/usecases/get_profiles_usecase.dart';
import 'package:timeline_updater_admin_app/src/features/users/domain/entities/profile_entity.dart';

part 'profiles_table_state_notifier.g.dart';

/// Handles the profiles table state
@riverpod
class ProfilesTableStateNotifier extends _$ProfilesTableStateNotifier with OffsetPaginationNotifierMixin<ProfileEntity, Object> {

  @override
  Future<OffsetPaginationData<ProfileEntity>> build() => initialLoad();

  @override
  FutureResult<List<ProfileEntity>, Object> fetch({
    required int offset
  }) async {
    final GetProfilesUsecaseParams getProfilesUsecaseParams = GetProfilesUsecaseParams(offset: offset);
    final GetProfilesUsecase getProfilesUsecase = ref.watch(getProfilesUsecaseProvider);
    return await getProfilesUsecase.call(getProfilesUsecaseParams);
  }
}