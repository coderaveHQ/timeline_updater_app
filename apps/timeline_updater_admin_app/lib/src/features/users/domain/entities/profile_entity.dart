import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An entity for profiles
class ProfileEntity {

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
  const ProfileEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type
  });
}