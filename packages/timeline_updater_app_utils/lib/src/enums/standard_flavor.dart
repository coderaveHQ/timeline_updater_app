/// An enum for the standard flavors
enum StandardFlavor {

  /// Enterprise
  enterprise(
    dbValue: 'enterprise'
  ),

  /// Plastics
  plastics(
    dbValue: 'plastics'
  ),

  /// Neo
  neo(
    dbValue: 'neo'
  ),

  /// Components
  components(
    dbValue: 'components'
  ),

  /// Electronics
  electronics(
    dbValue: 'electronics'
  ),

  /// Guss
  guss(
    dbValue: 'guss'
  );

  /// The string value stored in the database
  final String dbValue;

  /// Default constructor
  const StandardFlavor({
    required this.dbValue
  });

  /// Gets the enum value based on the database string
  static StandardFlavor fromDbValue(String dbValue) {
    return StandardFlavor.values.firstWhere((StandardFlavor standardFlavor) => standardFlavor.dbValue == dbValue);
  }
}