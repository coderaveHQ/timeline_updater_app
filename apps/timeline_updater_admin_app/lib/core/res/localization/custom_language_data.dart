import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// A custom class holding all localizable strings per language
class CustomLanguageData implements TLLanguageData {

  @override
  TLLanguageDataDeDE get deDE => const CustomLanguageDataDeDE();

  @override
  TLLanguageDataEnUS get enUS => const CustomLanguageDataEnUS();

  /// Default constructor
  const CustomLanguageData();
}

/// Holds all de-DE localized strings
class CustomLanguageDataDeDE extends TLLanguageDataDeDE implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataDeDE();

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
  String get successToastUserCreated => 'Benutzer*in erfolgreich erstellt!';
}

/// Holds all en-US localized strings
class CustomLanguageDataEnUS extends TLLanguageDataEnUS implements CustomLocalizable {

  /// Default constructor
  const CustomLanguageDataEnUS();

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
  String get successToastUserCreated => 'Successfully created a new user!';
}