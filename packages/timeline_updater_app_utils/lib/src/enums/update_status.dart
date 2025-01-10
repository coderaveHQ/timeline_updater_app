/// An enum for the update status
enum UpdateStatus {

  /// Server
  upcoming(
    dbValue: 'upcoming'
  ),

  /// Ongoing
  ongoing(
    dbValue: 'ongoing'
  ),
  
  /// Success
  success(
    dbValue: 'success'
  ),
  
  /// Warning
  warning(
    dbValue: 'warning'
  ),

  /// Error
  error(
    dbValue: 'error'
  );

  /// The string value stored in the database
  final String dbValue;

  /// Default constructor
  const UpdateStatus({
    required this.dbValue
  });

  /// Gets the enum value based on the database string
  static UpdateStatus fromDbValue(String dbValue) {
    return UpdateStatus.values.firstWhere((UpdateStatus updateStatus) => updateStatus.dbValue == dbValue);
  }
}