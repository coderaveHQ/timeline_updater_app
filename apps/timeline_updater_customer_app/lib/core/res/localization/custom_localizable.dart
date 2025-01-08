import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A custom class holding all localizable strings
abstract class CustomLocalizable extends TLLocalizable {
  
  /// Sign in page app bar title
  String get signInAppBarTitle;

  /// Sign in page title
  String get signInTitle;

  /// Sign in page subtitle
  String get signInSubtitle;

  /// Sign in page email text field hint
  String get signInEmailTextFieldHint;

  /// Sign in page password text field hint
  String get signInPasswordTextFieldHint;

  /// Sign in page sign in button title
  String get signInSignInButtonTitle;

  /// Title for the sign out button
  String get signOutButtonTitle;

  /// The updates navigation rail item title
  String get navigationRailUpdatesTitle;

  /// The settings navigation rail item title
  String get navigationRailSettingsTitle;

  /// The documentation navigation rail item title
  String get navigationRailDocumentationTitle;

  /// The web app navigation rail item title
  String get navigationRailWebAppTitle;
}