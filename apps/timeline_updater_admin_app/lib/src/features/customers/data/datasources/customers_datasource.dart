import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/customers/data/datasources/customers_datasource_impl.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_profile_dto.dart';

part 'customers_datasource.g.dart';

/// A datasource for customers
@riverpod
CustomersDatasource customersDatasource(Ref ref) {
  return CustomersDatasourceImpl();
}

/// An interface for the customers datasource
abstract interface class CustomersDatasource {
  
  /// Default constructor
  const CustomersDatasource();

  /// Gets all customers
  Future<List<CustomerDto>> getCustomers({
    required int offset
  });

  /// Gets all customers profiles
  Future<List<CustomerProfileDto>> getCustomerProfiles({
    required String customerId,
    required int offset
  });

  /// Gets all customers mandants
  Future<List<CustomerMandantDto>> getCustomerMandants({
    required String customerId,
    required int offset
  });
}