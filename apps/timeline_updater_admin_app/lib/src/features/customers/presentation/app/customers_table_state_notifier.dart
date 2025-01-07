import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/usecases/get_customers_usecase.dart';

part 'customers_table_state_notifier.g.dart';

/// Handles the customers table state
@riverpod
class CustomersTableStateNotifier extends _$CustomersTableStateNotifier with OffsetPaginationNotifierMixin<CustomerEntity, Object> {

  @override
  Future<OffsetPaginationData<CustomerEntity>> build() => initialLoad();

  @override
  FutureResult<List<CustomerEntity>, Object> fetch({
    required int offset
  }) async {
    final GetCustomersUsecaseParams getCustomersUsecaseParams = GetCustomersUsecaseParams(offset: offset);
    final GetCustomersUsecase getCustomersUsecase = ref.watch(getCustomersUsecaseProvider);
    return await getCustomersUsecase.call(getCustomersUsecaseParams);
  }
}