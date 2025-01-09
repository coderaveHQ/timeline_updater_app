/// An enum for the standard evolutions
enum StandardEvolution {

  /// E3
  e3(
    dbValue: 'e3',
    storageFolderName: 'e3'
  );

  /// The string value stored in the database
  final String dbValue;

  /// The folder name for the S3 storage
  final String storageFolderName;

  /// Default constructor
  const StandardEvolution({
    required this.dbValue,
    required this.storageFolderName
  });

  /// Gets the enum value based on the database string
  static StandardEvolution fromDbValue(String dbValue) {
    return StandardEvolution.values.firstWhere((StandardEvolution standardEvolution) => standardEvolution.dbValue == dbValue);
  }
}