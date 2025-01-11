import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/customer_mandant_entity.dart';
import 'package:timeline_updater_app/src/features/updates/domain/usecases/get_customer_mandants_usecase.dart';

part 'customer_mandants_table_state_notifier.g.dart';

/// Handles the customer mandants table state
@riverpod
class CustomerMandantsTableStateNotifier extends _$CustomerMandantsTableStateNotifier with OffsetPaginationNotifierMixin<CustomerMandantEntity, Object> {

  @override
  Future<OffsetPaginationData<CustomerMandantEntity>> build() => initialLoad();

  @override
  FutureResult<List<CustomerMandantEntity>, Object> fetch({
    required int offset
  }) async {
    final GetCustomerMandantsUsecaseParams getCustomerMandantsUsecaseParams = GetCustomerMandantsUsecaseParams(offset: offset);
    final GetCustomerMandantsUsecase getCustomerMandantsUsecase = ref.watch(getCustomerMandantsUsecaseProvider);
    return await getCustomerMandantsUsecase.call(getCustomerMandantsUsecaseParams);
  }
}