import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';

/// An abstract class for errors
abstract class IError implements Exception {
  
  /// A callback for the translation
  final String Function(TLLocalizable) message;

  /// Default constructor
  const IError(this.message);
}