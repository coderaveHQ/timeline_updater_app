import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/usecases/get_customer_mandants_usecase.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';

part 'customer_mandants_table_state_notifier.g.dart';

/// Handles the customer mandants table state
@riverpod
class CustomerMandantsTableStateNotifier extends _$CustomerMandantsTableStateNotifier with OffsetPaginationNotifierMixin<CustomerMandantEntity, Object> {

  @override
  Future<OffsetPaginationData<CustomerMandantEntity>> build(String customerId) => initialLoad();

  @override
  FutureResult<List<CustomerMandantEntity>, Object> fetch({
    required int offset
  }) async {
    final GetCustomerMandantsUsecaseParams getCustomerMandantsUsecaseParams = GetCustomerMandantsUsecaseParams(
      customerId: customerId,
      offset: offset
    );
    final GetCustomerMandantsUsecase getCustomerMandantsUsecase = ref.watch(getCustomerMandantsUsecaseProvider);
    return await getCustomerMandantsUsecase.call(getCustomerMandantsUsecaseParams);
  }
}