import 'package:shared_preferences/shared_preferences.dart';

/// A class for storing and retrieving TimeLine specific preferences
class TLPreferences {

  /// A `SharedPreferences` instance
  final SharedPreferences sharedPreferences;

  /// Default constructor
  const TLPreferences(this.sharedPreferences);
}