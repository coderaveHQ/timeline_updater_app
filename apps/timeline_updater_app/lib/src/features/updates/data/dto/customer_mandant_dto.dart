import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/customer_mandant_entity.dart';

/// A DTO for customer mandants
class CustomerMandantDto {

  /// The ID of the customer
  final String customerId;

  /// The name of the customer
  final String customerName;

  /// The ID of the customer mandant
  final String customerMandantId;

  /// The name of the customer mandant
  final String customerMandantName;

  /// Default constructor
  const CustomerMandantDto({
    required this.customerId,
    required this.customerName,
    required this.customerMandantId,
    required this.customerMandantName
  });

  /// Factory method to convert `CustomerMandantEntity` to `CustomerMandantDto`
  factory CustomerMandantDto.fromEntity(CustomerMandantEntity entity) => CustomerMandantDto(
    customerId: entity.customerId,
    customerName: entity.customerName,
    customerMandantId: entity.customerMandantId,
    customerMandantName: entity.customerMandantName
  );

  /// Converts the `CustomerMandantDto` to `CustomerMandantEntity`
  CustomerMandantEntity toEntity() => CustomerMandantEntity(
    customerId: customerId,
    customerName: customerName,
    customerMandantId: customerMandantId,
    customerMandantName: customerMandantName
  );

  /// Factory method to convert `JSON` to `CustomerMandantDto`
  factory CustomerMandantDto.fromJson(Json json) => CustomerMandantDto(
    customerId: json['customer_id'] as String,
    customerName: json['customer_name'] as String,
    customerMandantId: json['customer_mandant_id'] as String,
    customerMandantName: json['customer_mandant_name'] as String
  );

  /// Converts the `CustomerMandantDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'customer_id' : customerId,
    'customer_name' : customerName,
    'customer_mandant_id' : customerMandantId,
    'customer_mandant_name' : customerMandantName
  };
}