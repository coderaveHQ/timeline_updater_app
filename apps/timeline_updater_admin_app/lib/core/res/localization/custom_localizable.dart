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

  /// The description of the customers page
  String get customersDescription;

  /// The title of the customers table
  String get customersTableTitle;

  /// The title of the customers page customers table action button
  String get customersTableCreateCustomerButtonTitle;

  /// The text for when no customer is found in customers page
  String get customersTableEmpty;

  /// The title of the customers id table column
  String get customersTableIdColumnTitle;

  /// The title of the customers name table column
  String get customersTableNameColumnTitle;

  /// The title of the customers created at table column
  String get customersTableCreatedAtColumnTitle;

  /// The title of the customers updated at table column
  String get customersTableUpdatedAtColumnTitle;

  /// The title of the customers evolution table column
  String get customersTableEvolutionColumnTitle;

  /// The title of the customers version table column
  String get customersTableVersionColumnTitle;

  /// The title of the customers flavor table column
  String get customersTableFlavorColumnTitle;

  /// The app bar title of the customers details page
  String get customerDetailsAppBarTitle;

  /// The description of the customers details page
  String get customerDetailsDescription;

  /// The title of the details tab of the customer details page
  String get customerDetailsDetailsTabTitle;

  /// The title of the mandants tab of the customer details page
  String get customerDetailsMandantsTabTitle;

  /// The title of the profiles tab of the customer details page
  String get customerDetailsProfilesTabTitle;

  /// The title of the customer details mandants table
  String get customerDetailsMandantsTableTitle;

  /// The text of the customer details mandants table for when the list is empty
  String get customerDetailsMandantsTableEmpty;

  /// The title of the customer details mandants table create button
  String get customerDetailsMandantsTableCreateCustomerButtonTitle;

  /// The title of the customer details mandants table id column
  String get customerDetailsMandantsTableIdColumnTitle;

  /// The title of the customer details mandants table name column
  String get customerDetailsMandantsTableNameColumnTitle;

  /// The title of the customer details mandants table create at column
  String get customerDetailsMandantsTableCreatedAtColumnTitle;

  /// The title of the customer details mandants table updated at column
  String get customerDetailsMandantsTableUpdatedAtColumnTitle;

  /// The title of the customer details profiles table
  String get customerDetailsProfilesTableTitle;

  /// The text of the customer details profiles table for when the list is empty
  String get customerDetailsProfilesTableEmpty;

  /// The title of the customer details profiles table create button
  String get customerDetailsProfilesTableCreateCustomerButtonTitle;

  /// The title of the customer details profiles table id column
  String get customerDetailsProfilesTableIdColumnTitle;

  /// The title of the customer details profiles table name column
  String get customerDetailsProfilesTableNameColumnTitle;

  /// The title of the customer details profiles table create at column
  String get customerDetailsProfilesTableCreatedAtColumnTitle;

  /// The title of the customer details profiles table updated at column
  String get customerDetailsProfilesTableUpdatedAtColumnTitle;

  /// Toast for when a new user was created
  String get successToastUserCreated;
}