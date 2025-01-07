import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/repositories/customers_repository.dart';

part 'get_customers_usecase.g.dart';

/// A provider for the `GetCustomersUsecase`
@riverpod
GetCustomersUsecase getCustomersUsecase(Ref ref) {
  return GetCustomersUsecase(
    customersRepository: ref.read(customersRepositoryProvider)
  );
}

/// A usecase for getting customers
class GetCustomersUsecase extends FutureUsecaseWithParams<List<CustomerEntity>, Object, GetCustomersUsecaseParams> {
  
  /// The customers repository to be used
  final CustomersRepository _customersRepository;

  /// Default constructor
  const GetCustomersUsecase({
    required CustomersRepository customersRepository
  })  : _customersRepository = customersRepository;

  @override
  FutureResult<List<CustomerEntity>, Object> call(GetCustomersUsecaseParams params) async {
    return await _customersRepository.getCustomers(offset: params.offset);
  }
}

/// Parameters needed for the `GetCustomersUsecase`
class GetCustomersUsecaseParams {

  /// The current offset
  final int offset;

  /// Default constructor
  const GetCustomersUsecaseParams({ 
    required this.offset
  });
}