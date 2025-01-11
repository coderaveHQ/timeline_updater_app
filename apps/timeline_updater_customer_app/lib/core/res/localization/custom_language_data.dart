import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_customer_app/core/res/localization/custom_localizable.dart';

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
  String get navigationRailUpdatesTitle => 'Updates';

  @override
  String get navigationRailSettingsTitle => 'Einstellungen';

  @override
  String get navigationRailDocumentationTitle => 'Dokumentation';

  @override
  String get navigationRailWebAppTitle => 'Im Browser öffnen';

  @override
  String get updatesAppBarTitle => 'Updates';

  @override
  String get updatesDescription => 'Sieh dir alle Updates an oder erstelle ein Neues.';

  @override
  String get updatesTableTitle => 'Alle Updates';

  @override
  String get updatesTableEmpty => 'Keine Updates gefunden.';

  @override
  String get updatesTableIdColumnTitle => 'ID';

  @override
  String get updatesTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get updatesTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get updatesTableMandantNameColumnTitle => 'Mandant';

  @override
  String get updatesTableTimedAtColumnTitle => 'Geplant';

  @override
  String get updatesTableStatusColumnTitle => 'Status';

  @override
  String get updatesTableTitleColumnTitle => 'Titel';
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
  String get navigationRailUpdatesTitle => 'Updates';

  @override
  String get navigationRailSettingsTitle => 'Settings';

  @override
  String get navigationRailDocumentationTitle => 'Documentation';

  @override
  String get navigationRailWebAppTitle => 'Open in browser';

  @override
  String get updatesAppBarTitle => 'Updates';

  @override
  String get updatesDescription => 'View all updates or create a new one.';

  @override
  String get updatesTableTitle => 'All updates';

  @override
  String get updatesTableEmpty => 'Keine Updates gefunden.';

  @override
  String get updatesTableIdColumnTitle => 'ID';

  @override
  String get updatesTableCreatedAtColumnTitle => 'Created at';

  @override
  String get updatesTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get updatesTableMandantNameColumnTitle => 'Mandant';

  @override
  String get updatesTableTimedAtColumnTitle => 'Timed at';

  @override
  String get updatesTableStatusColumnTitle => 'Status';

  @override
  String get updatesTableTitleColumnTitle => 'Title';
}