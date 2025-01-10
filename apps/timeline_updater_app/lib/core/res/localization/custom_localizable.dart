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

  /// The standards navigation rail item item
  String get navigationRailStandardsTitle;

  /// The updates navigation rail item title
  String get navigationRailUpdatesTitle;

  /// The settings navigation rail item title
  String get navigationRailSettingsTitle;

  /// The documentation navigation rail item title
  String get navigationRailDocumentationTitle;

  /// The web app navigation rail item title
  String get navigationRailWebAppTitle;

  /// Standards app bar title
  String get standardsAppBarTitle;

  /// The description of the standards page
  String get standardsDescription;

  /// The title of the standards table
  String get standardsTableTitle;

  /// The title of the standards page standards table action button
  String get standardsTableUploadStandardButtonTitle;

  /// The text for when no standard is found in standards page
  String get standardsTableEmpty;

  /// The title of the standards id table column
  String get standardsTableIdColumnTitle;

  /// The title of the standards created at table column
  String get standardsTableCreatedAtColumnTitle;

  /// The title of the standards updated at table column
  String get standardsTableUpdatedAtColumnTitle;

  /// The title of the standards updated at table column
  String get standardsTableTypeColumnTitle;

  /// The title of the standards evolution table column
  String get standardsTableEvolutionColumnTitle;

  /// The title of the standards version table column
  String get standardsTableVersionColumnTitle;

  /// The title of the standards flavor table column
  String get standardsTableFlavorColumnTitle;

  /// The title of the standards patch table column
  String get standardsTablePatchColumnTitle;

  /// The title of the upload standard dialog
  String get uploadStandardDialogTitle;

  /// The description of the upload standard dialog
  String get uploadStandardDialogDescription;

  /// The action button title of the upload standard dialog
  String get uploadStandardDialogActionButtonTitle;

  /// The click to upload text of the upload standard dialog
  String get uploadStandardDialogClickToUploadText;

  /// The use drag and drop text of the upload standard dialog
  String get uploadStandardDialogUseDragAndDropText;

  /// The title of the file section of the upload standard dialog
  String get uploadStandardDialogFileSectionTitle;

  /// The text to display when no file is selected
  String get uploadStandardDialogNoFileSelected;

  /// The title of the type section of the upload standard dialog
  String get uploadStandardDialogTypeSectionTitle;

  /// The title of the evolution section of the upload standard dialog
  String get uploadStandardDialogEvolutionSectionTitle;

  /// The title of the version section of the upload standard dialog
  String get uploadStandardDialogVersionSectionTitle;

  /// The title of the flavor section of the upload standard dialog
  String get uploadStandardDialogFlavorSectionTitle;

  /// The title of the patch section of the upload standard dialog
  String get uploadStandardDialogPatchSectionTitle;

  /// The text for when the patch date was not selected in the upload standard dialog
  String get uploadStandardDialogPatchEmpty;

  /// Updates app bar title
  String get updatesAppBarTitle;

  /// The description of the updates page
  String get updatesDescription;

  /// The text for when the patch date was not selected in the upload standard dialog
  String get updatesTableTitle;

  /// The title of the updates table
  String get updatesTableCreateUpdateButtonTitle;

  /// The text for when no update is found in updates page
  String get updatesTableEmpty;

  /// The title of the updates id table column
  String get updatesTableIdColumnTitle;

  /// The title of the updates created at table column
  String get updatesTableCreatedAtColumnTitle;

  /// The title of the updates updated at table column
  String get updatesTableUpdatedAtColumnTitle;

  /// The title of the updates id table column
  String get updatesTableCustomerNameColumnTitle;

  /// The title of the updates id table column
  String get updatesTableMandantNameColumnTitle;

  /// The title of the updates id table column
  String get updatesTableTimedAtColumnTitle;

  /// The title of the updates id table column
  String get updatesTableStatusColumnTitle;

  /// The title of the updates id table column
  String get updatesTableTitleColumnTitle;

  /// The title of the updates page standards table action button
  String get successToastStandardUploaded;
}