import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/repositories/customers_repository.dart';

part 'get_customer_profiles_usecase.g.dart';

/// A provider for the `GetCustomerProfilesUsecase`
@riverpod
GetCustomerProfilesUsecase getCustomerProfilesUsecase(Ref ref) {
  return GetCustomerProfilesUsecase(
    customersRepository: ref.read(customersRepositoryProvider)
  );
}

/// A usecase for getting customer profiles
class GetCustomerProfilesUsecase extends FutureUsecaseWithParams<List<CustomerProfileEntity>, Object, GetCustomerProfilesUsecaseParams> {
  
  /// The customers repository to be used
  final CustomersRepository _customersRepository;

  /// Default constructor
  const GetCustomerProfilesUsecase({
    required CustomersRepository customersRepository
  })  : _customersRepository = customersRepository;

  @override
  FutureResult<List<CustomerProfileEntity>, Object> call(GetCustomerProfilesUsecaseParams params) async {
    return await _customersRepository.getCustomerProfiles(
      customerId: params.customerId,
      offset: params.offset
    );
  }
}

/// Parameters needed for the `GetCustomerProfilesUsecase`
class GetCustomerProfilesUsecaseParams {

  /// The id of the customer
  final String customerId;

  /// The current offset
  final int offset;

  /// Default constructor
  const GetCustomerProfilesUsecaseParams({ 
    required this.customerId,
    required this.offset
  });
}