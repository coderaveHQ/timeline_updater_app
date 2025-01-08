import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_customer_app/src/features/auth/domain/usecases/auth_get_current_profile_usecase.dart';
import 'package:timeline_updater_customer_app/src/features/auth/domain/entities/profile_entity.dart';

part 'get_current_profile_provider.g.dart';

/// Provider for getting the current profile
@riverpod
Future<ProfileEntity> getCurrentProfile(Ref ref) async {
  final AuthGetCurrentProfileUsecase authGetCurrentProfileUsecase = ref.watch(authGetCurrentProfileUsecaseProvider);
  final Result<ProfileEntity, Object> result = await authGetCurrentProfileUsecase.call();
  return result.fold<ProfileEntity>(
    onSuccess: (ProfileEntity profile) => profile,
    onFailure: (Object error) => throw error
  );
}

// TODO: Outsource popover