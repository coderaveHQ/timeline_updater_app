/// An entity for customer mandants
class CustomerMandantEntity {

  /// The ID of the customer
  final String customerId;

  /// The name of the customer
  final String customerName;

  /// The ID of the customer mandant
  final String customerMandantId;

  /// The name of the customer mandant
  final String customerMandantName;

  /// Default constructor
  const CustomerMandantEntity({
    required this.customerId,
    required this.customerName,
    required this.customerMandantId,
    required this.customerMandantName
  });
}