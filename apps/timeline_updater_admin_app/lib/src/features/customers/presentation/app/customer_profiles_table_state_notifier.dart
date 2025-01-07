import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/usecases/get_customer_profiles_usecase.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';

part 'customer_profiles_table_state_notifier.g.dart';

/// Handles the customer profiles table state
@riverpod
class CustomerProfilesTableStateNotifier extends _$CustomerProfilesTableStateNotifier with OffsetPaginationNotifierMixin<CustomerProfileEntity, Object> {

  @override
  Future<OffsetPaginationData<CustomerProfileEntity>> build(String customerId) => initialLoad();

  @override
  FutureResult<List<CustomerProfileEntity>, Object> fetch({
    required int offset
  }) async {
    final GetCustomerProfilesUsecaseParams getCustomerProfilesUsecaseParams = GetCustomerProfilesUsecaseParams(
      customerId: customerId,
      offset: offset
    );
    final GetCustomerProfilesUsecase getCustomerProfilesUsecase = ref.watch(getCustomerProfilesUsecaseProvider);
    return await getCustomerProfilesUsecase.call(getCustomerProfilesUsecaseParams);
  }
}