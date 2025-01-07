import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_profile_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/repositories/customers_repository.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/datasources/customers_datasource.dart';

/// An implementation of the customers repository
class CustomersRepositoryImpl implements CustomersRepository {

  /// The customers datasource
  final CustomersDatasource _customersDatasource;

  /// Default constructor
  const CustomersRepositoryImpl({
    required CustomersDatasource customersDatasource
  })  : _customersDatasource = customersDatasource;

  @override
  FutureResult<List<CustomerEntity>, Object> getCustomers({
    required int offset
  }) async {
    try {
      final List<CustomerDto> customerDtos = await _customersDatasource.getCustomers(offset: offset);
      final List<CustomerEntity> customerEntities = customerDtos.map((CustomerDto dto) => dto.toEntity()).toList();
      return Success(data: customerEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<List<CustomerProfileEntity>, Object> getCustomerProfiles({
    required String customerId,
    required int offset
  }) async {
    try {
      final List<CustomerProfileDto> customerProfileDtos = await _customersDatasource.getCustomerProfiles(
        customerId: customerId,
        offset: offset
      );
      final List<CustomerProfileEntity> customerProfileEntities = customerProfileDtos.map((CustomerProfileDto dto) => dto.toEntity()).toList();
      return Success(data: customerProfileEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<List<CustomerMandantEntity>, Object> getCustomerMandants({
    required String customerId,
    required int offset
  }) async {
    try {
      final List<CustomerMandantDto> customerMandantDtos = await _customersDatasource.getCustomerMandants(
        customerId: customerId,
        offset: offset
      );
      final List<CustomerMandantEntity> customerMandantEntities = customerMandantDtos.map((CustomerMandantDto dto) => dto.toEntity()).toList();
      return Success(data: customerMandantEntities);
    } catch (e) {
      return Failure(error: e);
    }
  }
}