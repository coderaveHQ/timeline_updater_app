import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

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
  String get createUserAppBarTitle => 'Benutzer*in erstellen';

  @override
  String get createUserTitle => 'Lege ein neues Konto an!';

  @override
  String get createUserSubtitle => 'Hier kannst du dir selbst ein neues Konto anlegen.';

  @override
  String get createUserNameTextFieldHint => 'Name';

  @override
  String get createUserEmailTextFieldHint => 'E-Mail';

  @override
  String get createUserPasswordTextFieldHint => 'Passwort';

  @override
  String get createUserServiceKeyTextFieldHint => 'Serviceschlüssel';

  @override
  String get createUserCreateUserButtonTitle => 'Erstellen';

  @override
  String get signOutButtonTitle => 'Abmelden';

  @override
  String get navigationRailUsersTitle => 'Benutzer*innen';

  @override
  String get navigationRailCustomersTitle => 'Kund*innen';

  @override
  String get navigationRailSettingsTitle => 'Einstellungen';

  @override
  String get navigationRailDocumentationTitle => 'Dokumentation';

  @override
  String get navigationRailWebAppTitle => 'Im Browser öffnen';

  @override
  String get usersAppBarTitle => 'Benutzer*innen';

  @override
  String get usersDescription => 'Sieh dir alle Benutzer*innen an, bearbeite sie oder erstelle neue Konten.';

  @override
  String get usersProfilesTableTitle => 'Alle Benutzer*innen';

  @override
  String get usersProfilesTableCreateUserButtonTitle => 'Erstellen';

  @override
  String get usersProfilesTableEmpty => 'Keine Benutzer*innen gefunden.';

  @override
  String get usersProfilesTableIdColumnTitle => 'ID';

  @override
  String get usersProfilesTableNameColumnTitle => 'Name';

  @override
  String get usersProfilesTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get usersProfilesTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get usersProfilesTableUserTypeColumnTitle => 'Rolle';

  @override
  String get customersAppBarTitle => 'Kund*innen';

  @override
  String get customersDescription => 'Sieh dir alle Kund*innen an, bearbeite sie oder erstelle neue.';

  @override
  String get customersTableTitle => 'Alle Kund*innen';

  @override
  String get customersTableCreateCustomerButtonTitle => 'Erstellen';

  @override
  String get customersTableEmpty => 'Keine Kund*innen gefunden.';

  @override
  String get customersTableIdColumnTitle => 'ID';

  @override
  String get customersTableNameColumnTitle => 'Name';

  @override
  String get customersTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get customersTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get customersTableEvolutionColumnTitle => 'Entwicklung';

  @override
  String get customersTableVersionColumnTitle => 'Version';

  @override
  String get customersTableFlavorColumnTitle => 'Typ';

  @override
  String get customerDetailsAppBarTitle => 'Details';

  @override
  String get customerDetailsDescription => 'Sie dir generelle Details, Mandanten oder Benutzer*innen des / der Kund*in an.';

  @override
  String get customerDetailsDetailsTabTitle => 'Details';

  @override
  String get customerDetailsMandantsTabTitle => 'Mandanten';

  @override
  String get customerDetailsProfilesTabTitle => 'Benutzer*innen';

  @override
  String get customerDetailsMandantsTableTitle => 'Alle Mandanten';

  @override
  String get customerDetailsMandantsTableEmpty => 'Keine Mandanten gefunden.';

  @override
  String get customerDetailsMandantsTableCreateCustomerButtonTitle => 'Erstellen';

  @override
  String get customerDetailsMandantsTableIdColumnTitle => 'ID';

  @override
  String get customerDetailsMandantsTableNameColumnTitle => 'Name';

  @override
  String get customerDetailsMandantsTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get customerDetailsMandantsTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get customerDetailsProfilesTableTitle => 'Alle Benutzer*innen';

  @override
  String get customerDetailsProfilesTableEmpty => 'Keine Benutzer*innen gefunden.';

  @override
  String get customerDetailsProfilesTableCreateCustomerButtonTitle => 'Erstellen';

  @override
  String get customerDetailsProfilesTableIdColumnTitle => 'ID';

  @override
  String get customerDetailsProfilesTableNameColumnTitle => 'Name';

  @override
  String get customerDetailsProfilesTableCreatedAtColumnTitle => 'Erstellt';

  @override
  String get customerDetailsProfilesTableUpdatedAtColumnTitle => 'Zuletzt bearbeitet';

  @override
  String get successToastUserCreated => 'Benutzer*in erfolgreich erstellt!';
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
  String get createUserAppBarTitle => 'Create user';

  @override
  String get createUserTitle => 'Create a new account!';

  @override
  String get createUserSubtitle => 'Here you can create a new account for yourself.';

  @override
  String get createUserNameTextFieldHint => 'Name';

  @override
  String get createUserEmailTextFieldHint => 'E-Mail';

  @override
  String get createUserPasswordTextFieldHint => 'Password';

  @override
  String get createUserServiceKeyTextFieldHint => 'Service key';

  @override
  String get createUserCreateUserButtonTitle => 'Create';

  @override
  String get signOutButtonTitle => 'Abmelden';

  @override
  String get navigationRailUsersTitle => 'Users';

  @override
  String get navigationRailCustomersTitle => 'Customers';

  @override
  String get navigationRailSettingsTitle => 'Settings';

  @override
  String get navigationRailDocumentationTitle => 'Documentation';

  @override
  String get navigationRailWebAppTitle => 'Open in browser';

  @override
  String get usersAppBarTitle => 'Users';

  @override
  String get usersDescription => 'View all users, edit them or create new accounts.';

  @override
  String get usersProfilesTableTitle => 'All users';

  @override
  String get usersProfilesTableCreateUserButtonTitle => 'Create';

  @override
  String get usersProfilesTableEmpty => 'No users found.';

  @override
  String get usersProfilesTableIdColumnTitle => 'ID';

  @override
  String get usersProfilesTableNameColumnTitle => 'Name';

  @override
  String get usersProfilesTableCreatedAtColumnTitle => 'Created at';

  @override
  String get usersProfilesTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get usersProfilesTableUserTypeColumnTitle => 'Role';

  @override
  String get customersAppBarTitle => 'Customers';

  @override
  String get customersDescription => 'View all customers, edit them or create new ones.';

  @override
  String get customersTableTitle => 'All customers';

  @override
  String get customersTableCreateCustomerButtonTitle => 'Create';

  @override
  String get customersTableEmpty => 'No customers found.';

  @override
  String get customersTableIdColumnTitle => 'ID';

  @override
  String get customersTableNameColumnTitle => 'Name';

  @override
  String get customersTableCreatedAtColumnTitle => 'Created at';

  @override
  String get customersTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get customersTableEvolutionColumnTitle => 'Evolution';

  @override
  String get customersTableVersionColumnTitle => 'Version';

  @override
  String get customersTableFlavorColumnTitle => 'Flavor';

  @override
  String get customerDetailsAppBarTitle => 'Details';

  @override
  String get customerDetailsDescription => 'View general details, mandants and users of the customer.';

  @override
  String get customerDetailsDetailsTabTitle => 'Details';

  @override
  String get customerDetailsMandantsTabTitle => 'Mandants';

  @override
  String get customerDetailsProfilesTabTitle => 'Users';

  @override
  String get customerDetailsMandantsTableTitle => 'All mandants';

  @override
  String get customerDetailsMandantsTableEmpty => 'No mandants found.';

  @override
  String get customerDetailsMandantsTableCreateCustomerButtonTitle => 'Create';

  @override
  String get customerDetailsMandantsTableIdColumnTitle => 'ID';

  @override
  String get customerDetailsMandantsTableNameColumnTitle => 'Name';

  @override
  String get customerDetailsMandantsTableCreatedAtColumnTitle => 'Created at';

  @override
  String get customerDetailsMandantsTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get customerDetailsProfilesTableTitle => 'All users';

  @override
  String get customerDetailsProfilesTableEmpty => 'No users found.';

  @override
  String get customerDetailsProfilesTableCreateCustomerButtonTitle => 'Create';

  @override
  String get customerDetailsProfilesTableIdColumnTitle => 'ID';

  @override
  String get customerDetailsProfilesTableNameColumnTitle => 'Name';

  @override
  String get customerDetailsProfilesTableCreatedAtColumnTitle => 'Created at';

  @override
  String get customerDetailsProfilesTableUpdatedAtColumnTitle => 'Last updated at';

  @override
  String get successToastUserCreated => 'Successfully created a new user!';
}