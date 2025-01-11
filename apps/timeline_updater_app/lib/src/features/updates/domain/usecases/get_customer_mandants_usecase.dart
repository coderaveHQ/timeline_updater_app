import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/customer_mandant_entity.dart';
import 'package:timeline_updater_app/src/features/updates/domain/repositories/updates_repository.dart';

part 'get_customer_mandants_usecase.g.dart';

/// A provider for the `GetCustomerMandantsUsecase`
@riverpod
GetCustomerMandantsUsecase getCustomerMandantsUsecase(Ref ref) {
  return GetCustomerMandantsUsecase(
    updatesRepository: ref.read(updatesRepositoryProvider)
  );
}

/// A usecase for getting customer mandants
class GetCustomerMandantsUsecase extends FutureUsecaseWithParams<List<CustomerMandantEntity>, Object, GetCustomerMandantsUsecaseParams> {
  
  /// The updates repository to be used
  final UpdatesRepository _updatesRepository;

  /// Default constructor
  const GetCustomerMandantsUsecase({
    required UpdatesRepository updatesRepository
  })  : _updatesRepository = updatesRepository;

  @override
  FutureResult<List<CustomerMandantEntity>, Object> call(GetCustomerMandantsUsecaseParams params) async {
    return await _updatesRepository.getCustomerMandants(offset: params.offset);
  }
}

/// Parameters needed for the `GetCustomerMandantsUsecase`
class GetCustomerMandantsUsecaseParams {

  /// The current offset
  final int offset;

  /// Default constructor
  const GetCustomerMandantsUsecaseParams({ 
    required this.offset
  });
}