import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An entity for standards
class StandardEntity {

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
  const StandardEntity({
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
}