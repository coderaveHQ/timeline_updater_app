/// An enum for the standard version
enum StandardVersion {

  /// v15
  v15(
    dbValue: 'v15'
  ),

  /// v15.5
  v15_5(
    dbValue: 'v15.5'
  ),

  /// v16
  v16(
    dbValue: 'v16'
  );

  /// The string value stored in the database
  final String dbValue;

  /// Default constructor
  const StandardVersion({
    required this.dbValue
  });

  /// Gets the enum value based on the database string
  static StandardVersion fromDbValue(String dbValue) {
    return StandardVersion.values.firstWhere((StandardVersion standardVersion) => standardVersion.dbValue == dbValue);
  }
}