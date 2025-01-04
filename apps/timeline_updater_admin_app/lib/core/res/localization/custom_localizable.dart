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

  /// Create user page app bar title
  String get createUserAppBarTitle;

  /// Create user page title
  String get createUserTitle;

  /// Create user page subtitle
  String get createUserSubtitle;

  /// Create user page name text field hint
  String get createUserNameTextFieldHint;

  /// Create user page email text field hint
  String get createUserEmailTextFieldHint;

  /// Create user page password text field hint
  String get createUserPasswordTextFieldHint;

  /// Create user page service key text field hint
  String get createUserServiceKeyTextFieldHint;

  /// Create user page create user button title
  String get createUserCreateUserButtonTitle;

  /// Toast for when a new user was created
  String get successToastUserCreated;
}