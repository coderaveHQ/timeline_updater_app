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

  /// Gets the folder name for the S3 storage, respectively
  String get storageFolderName {
    return switch (this) {
      UpdateFileType.sql => 'sql',
      UpdateFileType.dynamicAssembly => 'dynamic_assemblies',
      UpdateFileType.customization => 'customizations',
      _ => throw Exception('This file type should not have a dedicated folder name.')
    };
  }
}