/// An enum for the standard flavors
enum StandardFlavor {

  /// Enterprise
  enterprise(
    dbValue: 'enterprise',
    storageFileName: 'enterprise'
  ),

  /// Plastics
  plastics(
    dbValue: 'plastics',
    storageFileName: 'plastics'
  ),

  /// Neo
  neo(
    dbValue: 'neo',
    storageFileName: 'neo'
  ),

  /// Components
  components(
    dbValue: 'components',
    storageFileName: 'components'
  ),

  /// Electronics
  electronics(
    dbValue: 'electronics',
    storageFileName: 'electronics'
  ),

  /// Guss
  guss(
    dbValue: 'guss',
    storageFileName: 'guss'
  );

  /// The string value stored in the database
  final String dbValue;

  /// Part of the file name for the S3 storage
  final String storageFileName;

  /// Default constructor
  const StandardFlavor({
    required this.dbValue,
    required this.storageFileName
  });

  /// Gets the enum value based on the database string
  static StandardFlavor fromDbValue(String dbValue) {
    return StandardFlavor.values.firstWhere((StandardFlavor standardFlavor) => standardFlavor.dbValue == dbValue);
  }
}