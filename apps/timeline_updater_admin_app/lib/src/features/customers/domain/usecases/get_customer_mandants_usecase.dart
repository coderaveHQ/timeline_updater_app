import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/repositories/customers_repository.dart';

part 'get_customer_mandants_usecase.g.dart';

/// A provider for the `GetCustomerMandantsUsecase`
@riverpod
GetCustomerMandantsUsecase getCustomerMandantsUsecase(Ref ref) {
  return GetCustomerMandantsUsecase(
    customersRepository: ref.read(customersRepositoryProvider)
  );
}

/// A usecase for getting customer mandants
class GetCustomerMandantsUsecase extends FutureUsecaseWithParams<List<CustomerMandantEntity>, Object, GetCustomerMandantsUsecaseParams> {
  
  /// The customers repository to be used
  final CustomersRepository _customersRepository;

  /// Default constructor
  const GetCustomerMandantsUsecase({
    required CustomersRepository customersRepository
  })  : _customersRepository = customersRepository;

  @override
  FutureResult<List<CustomerMandantEntity>, Object> call(GetCustomerMandantsUsecaseParams params) async {
    return await _customersRepository.getCustomerMandants(
      customerId: params.customerId,
      offset: params.offset
    );
  }
}

/// Parameters needed for the `GetCustomerMandantsUsecase`
class GetCustomerMandantsUsecaseParams {

  /// The id of the customer
  final String customerId;

  /// The current offset
  final int offset;

  /// Default constructor
  const GetCustomerMandantsUsecaseParams({ 
    required this.customerId,
    required this.offset
  });
}