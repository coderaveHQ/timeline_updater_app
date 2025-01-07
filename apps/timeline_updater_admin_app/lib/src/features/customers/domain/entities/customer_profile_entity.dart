/// An entity for customer profiles
class CustomerProfileEntity {

  /// The ID of the customers profile
  final String id;

  /// When the customers profile was created
  final DateTime createdAt;
 
  /// When the customers profile was last updated
  final DateTime updatedAt;

  /// The name of the customers profile
  final String name;

  /// Default constructor
  const CustomerProfileEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name
  });
}