
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/updates/domain/entites/update_entity.dart';

/// A DTO for updates
class UpdateDto {

  /// The ID of the update
  final String id;

  /// When the update was created
  final DateTime createdAt;

  /// When the update was last updated
  final DateTime updatedAt;

  /// The name of the customer
  final String customerName;

  /// The name of the mandant
  final String mandantName;

  /// When the update is timed
  final DateTime timedAt;
  
  /// The evolution of the standard file
  final UpdateStatus status;

  /// The title of the update
  final String title;

  /// Default constructor
  const UpdateDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.customerName,
    required this.mandantName,
    required this.timedAt,
    required this.status,
    required this.title
  });

  /// Factory method to convert `UpdateEntity` to `UpdateDto`
  factory UpdateDto.fromEntity(UpdateEntity entity) => UpdateDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    customerName: entity.customerName,
    mandantName: entity.mandantName,
    timedAt: entity.timedAt,
    status: entity.status,
    title: entity.title
  );

  /// Converts the `UpdateDto` to `UpdateEntity`
  UpdateEntity toEntity() => UpdateEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    customerName: customerName,
    mandantName: mandantName,
    timedAt: timedAt,
    status: status,
    title: title
  );

  /// Factory method to convert `JSON` to `UpdateDto`
  factory UpdateDto.fromJson(Json json) => UpdateDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    customerName: json['customer_name'] as String,
    mandantName: json['mandant_name'] as String,
    timedAt: DateTime.parse(json['timed_at'] as String),
    status: UpdateStatus.fromDbValue(json['status'] as String),
    title: json['title']
  );

  /// Converts the `UpdateDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'customer_name' : customerName,
    'mandant_name' : mandantName,
    'timed_at' : timedAt.toIso8601String(),
    'status' : status.dbValue,
    'title' : title
  };
}