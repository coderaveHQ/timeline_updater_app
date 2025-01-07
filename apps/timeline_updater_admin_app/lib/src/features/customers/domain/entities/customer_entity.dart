import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An entity for customers
class CustomerEntity {

  /// The ID of the customer
  final String id;

  /// When the customer was created
  final DateTime createdAt;

  /// When the customer was last updated
  final DateTime updatedAt;

  /// The name of the customer
  final String name;

  /// The installed evolution
  final StandardEvolution evolution;

  /// The installed version
  final StandardVersion version;

  /// The installed flavor
  final StandardFlavor flavor;

  /// Default constructor
  const CustomerEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.evolution,
    required this.version,
    required this.flavor
  });
}