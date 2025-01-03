import 'package:timeline_updater_app_ui/error/i_error.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';

/// A class holding possible launch errors
class LaunchError extends IError {

  /// An error for when an URL could not be opened
  LaunchError.urlNotOpened() : super((TLLocalizable language) => language.launchErrorUrlNotOpened);
}