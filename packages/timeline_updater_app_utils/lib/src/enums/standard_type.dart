/// An enum for the standard type
enum StandardType {

  /// Server
  server(
    dbValue: 'server',
    storageFileNamePrefix: 'server'
  ),

  /// Client
  client(
    dbValue: 'client',
    storageFileNamePrefix: 'client'
  );

  /// The string value stored in the database
  final String dbValue;

  /// The prefix of the file name for the S3 storage
  final String storageFileNamePrefix;

  /// Default constructor
  const StandardType({
    required this.dbValue,
    required this.storageFileNamePrefix
  });

  /// Gets the enum value based on the database string
  static StandardType fromDbValue(String dbValue) {
    return StandardType.values.firstWhere((StandardType standardType) => standardType.dbValue == dbValue);
  }
}