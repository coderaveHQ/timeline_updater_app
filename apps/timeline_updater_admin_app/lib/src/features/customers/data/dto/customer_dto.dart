import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/src/features/customers/domain/entities/customer_entity.dart';

/// A DTO for customers
class CustomerDto {

  /// The ID of the customer
  final String id;

  /// When the customer was created
  final DateTime createdAt;

  /// When the customer was last updated
  final DateTime updatedAt;

  /// The name of the customer
  final String name;

  /// The standard evolution installed
  final StandardEvolution evolution;

  /// The standard version installed
  final StandardVersion version;

  /// The standard flavor installed
  final StandardFlavor flavor;

  /// Default constructor
  const CustomerDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.evolution,
    required this.version,
    required this.flavor
  });

  /// Factory method to convert `CustomerEntity` to `CustomerDTO`
  factory CustomerDto.fromEntity(CustomerEntity entity) => CustomerDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    name: entity.name,
    evolution: entity.evolution,
    version: entity.version,
    flavor: entity.flavor
  );

  /// Converts the `CustomerDTO` to `CustomerEntity`
  CustomerEntity toEntity() => CustomerEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    name: name,
    evolution: evolution,
    version: version,
    flavor: flavor
  );

  /// Factory method to convert `JSON` to `CustomerDto`
  factory CustomerDto.fromJson(Json json) => CustomerDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    name: json['name'] as String,
    evolution: StandardEvolution.fromDbValue(json['evolution'] as String),
    version: StandardVersion.fromDbValue(json['version'] as String),
    flavor: StandardFlavor.fromDbValue(json['flavor'] as String)
  );

  /// Converts the `CustomerDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'name' : name,
    'evolution' : evolution,
    'version' : version,
    'flavor' : flavor
  };
}