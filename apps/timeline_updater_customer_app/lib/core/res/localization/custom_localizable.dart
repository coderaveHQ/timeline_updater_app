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

  /// Updates app bar title
  String get updatesAppBarTitle;

  /// The description of the updates page
  String get updatesDescription;

  /// The text for when the patch date was not selected in the upload standard dialog
  String get updatesTableTitle;

  /// The text for when no update is found in updates page
  String get updatesTableEmpty;

  /// The title of the updates id table column
  String get updatesTableIdColumnTitle;

  /// The title of the updates created at table column
  String get updatesTableCreatedAtColumnTitle;

  /// The title of the updates updated at table column
  String get updatesTableUpdatedAtColumnTitle;

  /// The title of the updates mandant name table column
  String get updatesTableMandantNameColumnTitle;

  /// The title of the updates timed at table column
  String get updatesTableTimedAtColumnTitle;

  /// The title of the updates status table column
  String get updatesTableStatusColumnTitle;

  /// The title of the updates title table column
  String get updatesTableTitleColumnTitle;
}