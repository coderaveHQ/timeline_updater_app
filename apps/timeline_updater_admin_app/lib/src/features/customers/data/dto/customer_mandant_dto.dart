import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_mandant_entity.dart';

/// A DTO for customer mandants
class CustomerMandantDto {

  /// The ID of the customers mandant
  final String id;

  /// When the customers mandant was created
  final DateTime createdAt;

  /// When the customers mandant was last updated
  final DateTime updatedAt;

  /// The name of the customers mandant
  final String name;

  /// Wether the customer mandant is in production
  final bool isProduction;

  /// Default constructor
  const CustomerMandantDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.isProduction
  });

  /// Factory method to convert `CustomerMandantEntity` to `CustomerMandantDto`
  factory CustomerMandantDto.fromEntity(CustomerMandantEntity entity) => CustomerMandantDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    name: entity.name,
    isProduction: entity.isProduction
  );

  /// Converts the `CustomerMandantDto` to `CustomerMandantEntity`
  CustomerMandantEntity toEntity() => CustomerMandantEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    name: name,
    isProduction: isProduction
  );

  /// Factory method to convert `JSON` to `CustomerMandantDto`
  factory CustomerMandantDto.fromJson(Json json) => CustomerMandantDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    name: json['name'] as String,
    isProduction: json['is_production'] as bool
  );

  /// Converts the `CustomerMandantDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'name' : name,
    'is_production' : isProduction
  };
}