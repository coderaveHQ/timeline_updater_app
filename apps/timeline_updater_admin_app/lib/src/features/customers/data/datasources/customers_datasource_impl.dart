import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_mandant_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_profile_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/dto/customer_dto.dart';
import 'package:timeline_updater_admin_app/src/features/customers/data/datasources/customers_datasource.dart';

/// An implementation of the customers datasource
class CustomersDatasourceImpl implements CustomersDatasource {

  /// Default constructor
  const CustomersDatasourceImpl();

  @override
  Future<List<CustomerDto>> getCustomers({
    required int offset
  }) async {
    final List<Json> customerRows = await Supabase.instance.client.rpc('app_get_customers', params: <String, dynamic>{
      'in_offset' : offset
    });
    return customerRows.map((Json customerRow) => CustomerDto.fromJson(customerRow)).toList();
  }

  @override
  Future<List<CustomerProfileDto>> getCustomerProfiles({
    required String customerId,
    required int offset
  }) async {
    final List<Json> customerProfileRows = await Supabase.instance.client.rpc('app_get_customer_profiles', params: <String, dynamic>{
      'in_customer_id' : customerId,
      'in_offset' : offset
    });
    return customerProfileRows.map((Json customerProfileRow) => CustomerProfileDto.fromJson(customerProfileRow)).toList();
  }

  @override
  Future<List<CustomerMandantDto>> getCustomerMandants({
    required String customerId,
    required int offset
  }) async {
    final List<Json> customerMandantRows = await Supabase.instance.client.rpc('app_get_customer_mandants', params: <String, dynamic>{
      'in_customer_id' : customerId,
      'in_offset' : offset
    });
    return customerMandantRows.map((Json customerMandantRow) => CustomerMandantDto.fromJson(customerMandantRow)).toList();
  }
}