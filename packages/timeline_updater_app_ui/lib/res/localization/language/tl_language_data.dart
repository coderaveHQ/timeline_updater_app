/// A class holding all localizable strings
abstract class TLLocalizable {

  /// TLToast.success.signedIn
  String get successToastSignedIn;

  /// TLToast.success.signedOut
  String get successToastSignedOut;

  /// ValidationError.invalidEmail
  String get validationErrorInvalidEmail;

  /// ValidationError.invalidPassword
  String get validationErrorInvalidPassword;

  /// ValidationError.invalidName
  String get validationErrorInvalidName;

  /// ValidationError.invalidServiceKey
  String get validationErrorInvalidServiceKey;

  /// LaunchError.urlNotOpened
  String get launchErrorUrlNotOpened;

  /// Unknown error
  String get unknownErrorMessage;
}

/// A class holding all localizable strings per language
class TLLanguageData {

  /// de-DE
  final TLLanguageDataDeDE deDE;

  /// en-US
  final TLLanguageDataEnUS enUS;

  /// Default constructor
  const TLLanguageData({
    required this.deDE,
    required this.enUS
  });
}

/// Holds all de-DE localized strings
class TLLanguageDataDeDE implements TLLocalizable {

  /// Default constructor
  const TLLanguageDataDeDE();

  @override
  String get successToastSignedIn => 'Erfolgreich angemeldet.';

  @override
  String get successToastSignedOut => 'Erfolgreich abgemeldet.';

  @override
  String get validationErrorInvalidEmail => 'Das scheint keine valide E-Mail zu sein.';

  @override
  String get validationErrorInvalidPassword => 'Das Passwort muss zwischen 6 und 128 Zeichen lang sein.';

  @override
  String get validationErrorInvalidName =>  'Der Name muss zwischen 2 und 64 Zeichen lang sein.';

  @override
  String get validationErrorInvalidServiceKey => 'Der Serviceschlüssel darf nicht leer sein.';

  @override
  String get launchErrorUrlNotOpened => 'Die URL konnte nicht geöffnet werden.';

  @override
  String get unknownErrorMessage => 'Ein unbekannter Fehler ist aufgetreten';
}

/// Holds all en-US localized strings
class TLLanguageDataEnUS implements TLLocalizable {

  /// Default constructor
  const TLLanguageDataEnUS();

  @override
  String get successToastSignedIn => 'Successfully signed in.';

  @override
  String get successToastSignedOut => 'Successfully signed out.';

  @override
  String get validationErrorInvalidEmail => 'This does not seem to be a valid E-Mail';

  @override
  String get validationErrorInvalidPassword => 'The password has to be between 6 and 128 characters long.';

  @override
  String get validationErrorInvalidName =>  'The name has to be between 2 and 64 characters long.';

  @override
  String get validationErrorInvalidServiceKey => 'The service key can not be empty.';

  @override
  String get launchErrorUrlNotOpened => 'The URL could not be opened.';

  @override
  String get unknownErrorMessage => 'An unknown error occured';
}