/// An enum for the update file type
enum UpdateFileType {

  /// Customization
  customization(
    dbValue: 'customization'
  ),

  /// Dynamic Assembly
  dynamicAssembly(
    dbValue: 'dynamic_assembly'
  ),
  
  /// SQL
  sql(
    dbValue: 'sql'
  ),
  
  /// Server
  server(
    dbValue: 'server'
  ),

  /// Client
  client(
    dbValue: 'client'
  );

  /// The string value stored in the database
  final String dbValue;

  /// Default constructor
  const UpdateFileType({
    required this.dbValue
  });

  /// Gets the enum value based on the database string
  static UpdateFileType fromDbValue(String dbValue) {
    return UpdateFileType.values.firstWhere((UpdateFileType fileType) => fileType.dbValue == dbValue);
  }
}