/// An enum for defining user types
enum UserType {

  /// Admin
  admin(
    dbValue: 'admin'
  ),

  /// Employee
  employee(
    dbValue: 'employee'
  ),

  /// Customer
  customer(
    dbValue: 'customer'
  );

  /// The string value of the database enum
  final String dbValue;

  /// Default constructor
  const UserType({
    required this.dbValue
  });

  /// Converts a string value to an enum value
  static UserType fromDbValue(String dbValue) {
    return UserType.values.firstWhere((UserType userType) => userType.dbValue == dbValue);
  }
}