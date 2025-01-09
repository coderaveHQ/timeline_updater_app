import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/standards/domain/entities/standard_entity.dart';

/// A DTO for standards
class StandardDto {

  /// The ID of the standard
  final String id;

  /// When the standard was created
  final DateTime createdAt;

  /// When the standard was last updated
  final DateTime updatedAt;

  /// The path where the file is located
  final String filePath;

  /// The type of standard file
  final StandardType type;
  
  /// The evolution of the standard file
  final StandardEvolution evolution;

  /// The version of the standard file
  final StandardVersion version;

  /// The flavor of the standard file
  final StandardFlavor? flavor;

  /// The patch date of the standard file
  final DateTime patch;

  /// Default constructor
  const StandardDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.filePath,
    required this.type,
    required this.evolution,
    required this.version,
    this.flavor,
    required this.patch
  });

  /// Factory method to convert `StandardEntity` to `StandardDto`
  factory StandardDto.fromEntity(StandardEntity entity) => StandardDto(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    filePath: entity.filePath,
    type: entity.type,
    evolution: entity.evolution,
    version: entity.version,
    flavor: entity.flavor,
    patch: entity.patch
  );

  /// Converts the `StandardDto` to `StandardEntity`
  StandardEntity toEntity() => StandardEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    filePath: filePath,
    type: type,
    evolution: evolution,
    version: version,
    flavor: flavor,
    patch: patch
  );

  /// Factory method to convert `JSON` to `StandardDto`
  factory StandardDto.fromJson(Json json) => StandardDto(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
    filePath: json['file_path'] as String,
    type: StandardType.fromDbValue(json['type'] as String),
    evolution: StandardEvolution.fromDbValue(json['evolution'] as String),
    version: StandardVersion.fromDbValue(json['version'] as String),
    flavor: (json['flavor'] as String?).whenNotNull((String dbValue) => StandardFlavor.fromDbValue(dbValue)),
    patch: DateTime.parse(json['patch'] as String)
  );

  /// Converts the `StandardDto` to `JSON`
  Json toJson() => <String, dynamic>{
    'id' : id,
    'created_at' : createdAt.toIso8601String(),
    'updated_at' : updatedAt.toIso8601String(),
    'file_path' : filePath,
    'type' : type,
    'evolution' : evolution,
    'version' : version,
    if (flavor != null) 'flavor' : flavor,
    'patch' : patch
  };
}