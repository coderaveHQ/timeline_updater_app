import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/repositories/customers_repository_impl.dart';
import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/datasources/customers_datasource.dart';

part 'customers_repository.g.dart';

/// The repository for customers
@riverpod
CustomersRepository customersRepository(Ref ref) {
  return CustomersRepositoryImpl(
    customersDatasource: ref.read(customersDatasourceProvider)
  );
}

/// An interface for the customers repository
abstract interface class CustomersRepository {

  /// Gets all customers
  FutureResult<List<CustomerEntity>, Object> getCustomers({
    required int offset
  });

  /// Gets all customers profiles
  FutureResult<List<CustomerProfileEntity>, Object> getCustomerProfiles({
    required String customerId,
    required int offset
  });

  /// Gets all customers mandants
  FutureResult<List<CustomerMandantEntity>, Object> getCustomerMandants({
    required String customerId,
    required int offset
  });
}