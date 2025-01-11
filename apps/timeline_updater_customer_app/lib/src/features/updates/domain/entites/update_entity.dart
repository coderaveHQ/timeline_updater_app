import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An entity for updates
class UpdateEntity {

  /// The ID of the update
  final String id;

  /// When the update was created
  final DateTime createdAt;

  /// When the update was last updated
  final DateTime updatedAt;

  /// The name of the mandant
  final String mandantName;

  /// When the update is timed
  final DateTime timedAt;
  
  /// The evolution of the standard file
  final UpdateStatus status;

  /// The title of the update
  final String title;

  /// Default constructor
  const UpdateEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.mandantName,
    required this.timedAt,
    required this.status,
    required this.title
  });
}