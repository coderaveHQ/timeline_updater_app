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
}