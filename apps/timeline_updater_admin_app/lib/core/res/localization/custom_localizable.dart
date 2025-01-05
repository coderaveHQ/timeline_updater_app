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

  /// Title for the sign out button
  String get signOutButtonTitle;

  /// The users navigation rail item title
  String get navigationRailUsersTitle;

  /// The customers navigation rail item title
  String get navigationRailCustomersTitle;

  /// The settings navigation rail item title
  String get navigationRailSettingsTitle;

  /// The documentation navigation rail item title
  String get navigationRailDocumentationTitle;

  /// The web app navigation rail item title
  String get navigationRailWebAppTitle;

  /// Users app bar title
  String get usersAppBarTitle;

  /// The description of the users page
  String get usersDescription;

  /// The title of the profiles table
  String get usersProfilesTableTitle;

  /// The title of the users page profiles table action button
  String get usersProfilesTableCreateUserButtonTitle;

  /// The text for when no profile is found in users page
  String get usersProfilesTableEmpty;

  /// The title of the users profile table id column
  String get usersProfilesTableIdColumnTitle;

  /// The title of the users profile table name column
  String get usersProfilesTableNameColumnTitle;

  /// The title of the users profile table created at column
  String get usersProfilesTableCreatedAtColumnTitle;

  /// The title of the users profile table updated at column
  String get usersProfilesTableUpdatedAtColumnTitle;

  /// The title of the users profile table user type column
  String get usersProfilesTableUserTypeColumnTitle;

  /// Customers app bar title
  String get customersAppBarTitle;

  /// Toast for when a new user was created
  String get successToastUserCreated;
}