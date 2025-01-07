import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_profile_entity.dart';

/// A DTO for customer profiles
class CustomerProfileDto {

  /// The ID of the customers profile
  final String id;

  /// When the customers profile was created
  final DateTime createdAt;

  /// When the customers profile was last updated
  final DateTime updatedAt;

  /// The name of the customers profile
  final String name;

  /// Default constructor
  const CustomerProfileDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name
  });

  /// Factory method to convert `CustomerProfileEntity` to `CustomerProfileDto`
  factory CustomerProfileDto.fromEntity(CustomerProfileEntity entity) => CustomerProfileDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    name: entity.name
  );

  /// Converts the `CustomerProfileDto` to `CustomerProfileEntity`
  CustomerProfileEntity toEntity() => CustomerProfileEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    name: name
  );

  /// Factory method to convert `JSON` to `CustomerProfileDto`
  factory CustomerProfileDto.fromJson(Json json) => CustomerProfileDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    name: json['name'] as String
  );

  /// Converts the `CustomerProfileDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'name' : name
  };
}