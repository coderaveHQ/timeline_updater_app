import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/auth/domain/entities/profile_entity.dart';

/// A DTO for profiles
class ProfileDto {

  /// The ID of the profile
  final String id;

  /// When the profile was created
  final DateTime createdAt;

  /// When the profile was last updated
  final DateTime updatedAt;

  /// The name of the profile
  final String name;

  /// The type of user
  final UserType type;

  /// Default constructor
  const ProfileDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type
  });

  /// Factory method to convert `ProfileEntity` to `ProfileDTO`
  factory ProfileDto.fromEntity(ProfileEntity entity) => ProfileDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    name: entity.name,
    type: entity.type
  );

  /// Converts the `ProfileDTO` to `ProfileEntity`
  ProfileEntity toEntity() => ProfileEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    name: name,
    type: type
  );

  /// Factory method to convert `JSON` to `ProfileDTO`
  factory ProfileDto.fromJson(Json json) => ProfileDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    name: json['name'] as String,
    type: UserType.fromDbValue(json['type'] as String)
  );

  /// Converts the `ProfileDTO` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'name' : name,
    'type' : type.dbValue
  };
}