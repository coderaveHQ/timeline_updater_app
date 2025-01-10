import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';

/// A custom class holding all localizable strings per language
class CustomLanguageData implements TLLanguageData {

  @override
  TLLanguageDataDe get de => const CustomLanguageDataDe();

  @override
  TLLanguageDataEn get en => const CustomLanguageDataEn();

  /// Default constructor
  const CustomLanguageData();
}

/// Holds all german localized strings
class CustomLanguageDataDe extends TLLanguageDataDe implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataDe();

  @override
  String get signInAppBarTitle => 'Anmelden';

  @override
  String get signInTitle => 'Schön dich zu sehen!';

  @override
  String get signInSubtitle => 'Melde dich kurz an, damit ich weiß mit wem ich es zu tun habe.';

  @override
  String get signInEmailTextFieldHint => 'E-Mail';

  @override
  String get signInPasswordTextFieldHint => 'Passwort';

  @override
  String get signInSignInButtonTitle => 'Anmelden';

  @override
  String get signOutButtonTitle => 'Abmelden';

  @override
  String get navigationRailStandardsTitle => 'Standards';

  @override
  String get navigationRailUpdatesTitle => 'Updates';

  @override
  String get navigationRailSettingsTitle => 'Einstellungen';

  @override
  String get navigationRailDocumentationTitle => 'Dokumentation';

  @override
  String get navigationRailWebAppTitle => 'Im Browser öffnen';

  @override
  String get standardsAppBarTitle => 'Standards';

  @override
  String get standardsDescription => 'Sieh dir alle Standards an oder lade einen neuen hoch.';

  @override
  String get standardsTableTitle => 'Alle Standards';

  @override
  String get standardsTableUploadStandardButtonTitle => 'Hochladen';

  @override
  String get standardsTableEmpty => 'Keine Standards gefunden.';

  @override
  String get standardsTableIdColumnTitle => 'ID';

  @override
  String get standardsTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get standardsTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get standardsTableTypeColumnTitle => 'Art';

  @override
  String get standardsTableEvolutionColumnTitle => 'Entwicklung';

  @override
  String get standardsTableVersionColumnTitle => 'Version';

  @override
  String get standardsTableFlavorColumnTitle => 'Typ';

  @override
  String get standardsTablePatchColumnTitle => 'Patch';

  @override
  String get uploadStandardDialogTitle => 'Standard hochladen';

  @override
  String get uploadStandardDialogDescription => 'Lade ein neues Standard-Kit hoch.';

  @override
  String get uploadStandardDialogActionButtonTitle => 'Hochladen';

  @override
  String get uploadStandardDialogClickToUploadText => 'Zum Hochladen klicken';

  @override
  String get uploadStandardDialogUseDragAndDropText => 'oder Drag & Drop nutzen';

  @override
  String get uploadStandardDialogFileSectionTitle => 'Ausgewählte Datei';

  @override
  String get uploadStandardDialogNoFileSelected => 'Keine Datei ausgewählt';

  @override
  String get uploadStandardDialogTypeSectionTitle => 'Typ';

  @override
  String get uploadStandardDialogEvolutionSectionTitle => 'Entwickung';

  @override
  String get uploadStandardDialogVersionSectionTitle => 'Version';

  @override
  String get uploadStandardDialogFlavorSectionTitle => 'Art';

  @override
  String get uploadStandardDialogPatchSectionTitle => 'Patch';

  @override
  String get uploadStandardDialogPatchEmpty => 'Patch-Datum auswählen';

  @override
  String get updatesAppBarTitle => 'Updates';

  @override
  String get updatesDescription => 'Sieh dir alle Updates an oder erstelle ein Neues.';

  @override
  String get updatesTableTitle => 'Alle Updates';

  @override
  String get updatesTableCreateUpdateButtonTitle => 'Erstellen';

  @override
  String get updatesTableEmpty => 'Keine Updates gefunden.';

  @override
  String get updatesTableIdColumnTitle => 'ID';

  @override
  String get updatesTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get updatesTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get updatesTableCustomerNameColumnTitle => 'Kund*in';

  @override
  String get updatesTableMandantNameColumnTitle => 'Mandant';

  @override
  String get updatesTableTimedAtColumnTitle => 'Geplant';

  @override
  String get updatesTableStatusColumnTitle => 'Status';

  @override
  String get updatesTableTitleColumnTitle => 'Titel';

  @override
  String get successToastStandardUploaded => 'Standard-Kit erfolgreich hochgeladen.';
}

/// Holds all english localized strings
class CustomLanguageDataEn extends TLLanguageDataEn implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataEn();

  @override
  String get signInAppBarTitle => 'Sign In';

  @override
  String get signInTitle => 'Nice to see you!';

  @override
  String get signInSubtitle => 'Sign in real quick so that I know who I am talking to.';

  @override
  String get signInEmailTextFieldHint => 'E-Mail';

  @override
  String get signInPasswordTextFieldHint => 'Password';

  @override
  String get signInSignInButtonTitle => 'Sign In';

  @override
  String get signOutButtonTitle => 'Abmelden';

  @override
  String get navigationRailStandardsTitle => 'Standards';

  @override
  String get navigationRailUpdatesTitle => 'Updates';

  @override
  String get navigationRailSettingsTitle => 'Settings';

  @override
  String get navigationRailDocumentationTitle => 'Documentation';

  @override
  String get navigationRailWebAppTitle => 'Open in browser';

  @override
  String get standardsAppBarTitle => 'Standards';

  @override
  String get standardsDescription => 'View all standards or upload a new one.';

  @override
  String get standardsTableTitle => 'All standards';

  @override
  String get standardsTableUploadStandardButtonTitle => 'Upload';

  @override
  String get standardsTableEmpty => 'No standards found.';

  @override
  String get standardsTableIdColumnTitle => 'ID';

  @override
  String get standardsTableCreatedAtColumnTitle => 'Created at';

  @override
  String get standardsTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get standardsTableTypeColumnTitle => 'Type';

  @override
  String get standardsTableEvolutionColumnTitle => 'Evolution';

  @override
  String get standardsTableVersionColumnTitle => 'Version';

  @override
  String get standardsTableFlavorColumnTitle => 'Flavor';

  @override
  String get standardsTablePatchColumnTitle => 'Patch';

  @override
  String get uploadStandardDialogTitle => 'Upload standard';

  @override
  String get uploadStandardDialogDescription => 'Upload a new standard kit.';

  @override
  String get uploadStandardDialogActionButtonTitle => 'Upload';

  @override
  String get uploadStandardDialogClickToUploadText => 'Click to upload';

  @override
  String get uploadStandardDialogUseDragAndDropText => 'or use Drag & Drop';

  @override
  String get uploadStandardDialogFileSectionTitle => 'Selected file';

  @override
  String get uploadStandardDialogNoFileSelected => 'No file selected';

  @override
  String get uploadStandardDialogTypeSectionTitle => 'Type';

  @override
  String get uploadStandardDialogEvolutionSectionTitle => 'Evolution';

  @override
  String get uploadStandardDialogVersionSectionTitle => 'Version';

  @override
  String get uploadStandardDialogFlavorSectionTitle => 'Flavor';

  @override
  String get uploadStandardDialogPatchSectionTitle => 'Patch';

  @override
  String get uploadStandardDialogPatchEmpty => 'Choose patch date';

  @override
  String get updatesAppBarTitle => 'Updates';

  @override
  String get updatesDescription => 'View all updates or create a new one.';

  @override
  String get updatesTableTitle => 'All updates';

  @override
  String get updatesTableCreateUpdateButtonTitle => 'Create';

  @override
  String get updatesTableEmpty => 'Keine Updates gefunden.';

  @override
  String get updatesTableIdColumnTitle => 'ID';

  @override
  String get updatesTableCreatedAtColumnTitle => 'Created at';

  @override
  String get updatesTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get updatesTableCustomerNameColumnTitle => 'Customer';

  @override
  String get updatesTableMandantNameColumnTitle => 'Mandant';

  @override
  String get updatesTableTimedAtColumnTitle => 'Timed at';

  @override
  String get updatesTableStatusColumnTitle => 'Status';

  @override
  String get updatesTableTitleColumnTitle => 'Title';

  @override
  String get successToastStandardUploaded => 'New standard kit uploaded successfully.';
}