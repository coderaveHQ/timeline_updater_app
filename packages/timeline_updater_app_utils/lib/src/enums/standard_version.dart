/// An enum for the standard version
enum StandardVersion {

  /// v15
  v15(
    dbValue: 'v15',
    storageFolderName: 'v15'
  ),

  /// v15.5
  v15_5(
    dbValue: 'v15.5',
    storageFolderName: 'v15.5'
  ),

  /// v16
  v16(
    dbValue: 'v16',
    storageFolderName: 'v16'
  );

  /// The string value stored in the database
  final String dbValue;

  /// The folder name for the S3 storage
  final String storageFolderName;

  /// Default constructor
  const StandardVersion({
    required this.dbValue,
    required this.storageFolderName
  });

  /// Gets the enum value based on the database string
  static StandardVersion fromDbValue(String dbValue) {
    return StandardVersion.values.firstWhere((StandardVersion standardVersion) => standardVersion.dbValue == dbValue);
  }
}