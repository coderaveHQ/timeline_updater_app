/// An entity for customer mandants
class CustomerMandantEntity {

  /// The ID of the customers mandant
  final String id;

  /// When the customers mandant was created
  final DateTime createdAt;
 
  /// When the customers mandant was last updated
  final DateTime updatedAt;

  /// The name of the customers mandant
  final String name;

  /// Wether the customer mandant is in production
  final bool isProduction;

  /// Default constructor
  const CustomerMandantEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.isProduction
  });
}