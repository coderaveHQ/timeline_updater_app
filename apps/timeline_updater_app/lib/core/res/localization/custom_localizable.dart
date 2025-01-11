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

  /// The title of the updates customer name table column
  String get updatesTableCustomerNameColumnTitle;

  /// The title of the updates mandant name table column
  String get updatesTableMandantNameColumnTitle;

  /// The title of the updates timed at table column
  String get updatesTableTimedAtColumnTitle;

  /// The title of the updates status table column
  String get updatesTableStatusColumnTitle;

  /// The title of the updates title table column
  String get updatesTableTitleColumnTitle;

  /// The app bar title of the create update page
  String get createUpdateAppBarTitle;

  /// The mandant section title of the create update page
  String get createUpdateMandantSectionTitle;

  /// The files section title of the create update page
  String get createUpdateFilesSectionTitle;

  /// The SQLs tab title of the create update page
  String get createUpdateFilesSqlsTabBarTitle;

  /// The Dynamic Assemblies tab title of the create update page
  String get createUpdateFilesDynamicAssembliesTabBarTitle;

  /// The Customization tab title of the create update page
  String get createUpdateFilesCustomizationTabBarTitle;

  /// The sql clickable text of the create update page
  String get createUpdateFilesSqlDropZoneClickableText;

  /// The sql other text of the create update page
  String get createUpdateFilesSqlDropZoneOtherText;

  /// The Dynamic Assemblies clickable text of the create update page
  String get createUpdateFilesDynamicAssembliesDropZoneClickableText;

  /// The Dynamic Assemblies other text of the create update page
  String get createUpdateFilesDynamicAssembliesDropZoneOtherText;

  /// The Customization clickable text of the create update page
  String get createUpdateFilesCustomizationDropZoneClickableText;

  /// The Customization other text of the create update page
  String get createUpdateFilesCustomizationDropZoneOtherText;

  /// The title of the selected files list of the create update page
  String get createUpdateSelectedFilesTitle;

  /// The title section title of the create update page
  String get createUpdateTitleSectionTitle;

  /// The hint of the create update title text field
  String get createUpdateTitleTextFieldHint;

  /// The release notes section title of the create update page
  String get createUpdateReleaseNotesSectionTitle;

  /// The hint of the create update release notes text field
  String get createUpdateReleaseNotesTextFieldHint;

  /// The timing section title of the create update page
  String get createUpdateTimingSectionTitle;

  /// The text to show when no time is selected for the timing text field on the create update page
  String get createUpdateEmptyTimingText;

  /// The create update button title of the create update page
  String get createUpdateCreateUpdateButtonTitle;

  /// The title of the customer mandants table
  String get customerMandantsTableTitle;

  /// The text for when no customer mandant is found
  String get customerMandantsTableEmpty;

  /// The title of the customer mandants customer name table column
  String get customerMandantsTableCustomerNameColumnTitle;

  /// The title of the customer mandants customer mandant name table column
  String get customerMandantsTableCustomerMandantNameColumnTitle;

  /// The title of the customer mandants isSelected table column
  String get customerMandantsTableCustomerIsSelectedColumnTitle;

  /// The text of the toast when a new update was created successfully
  String get successToastUpdateCreated;

  /// The text of the toast when a new standard was uploaded successfully
  String get successToastStandardUploaded;
}