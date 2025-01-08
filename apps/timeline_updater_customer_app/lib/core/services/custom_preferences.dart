import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

part 'custom_preferences.g.dart';

/// A provider for accessing the preferences.
/// 
/// The providers value should be overriden at startup.
@riverpod
CustomPreferences customPreferences(Ref ref) {
  throw UnimplementedError();
}

/// A custom class for storing preferences
class CustomPreferences extends TLUIPreferences {
  
  /// Default constructor
  const CustomPreferences(super.sharedPreferences);
}