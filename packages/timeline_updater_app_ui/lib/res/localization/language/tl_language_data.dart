/// A class holding all localizable strings
abstract class TLLocalizable {

  /// The title of the admin user type
  String get userTypeAdminTitle;

  /// The title of the employee user type
  String get userTypeEmployeeTitle;

  /// The title of the customer user type
  String get userTypeCustomerTitle;

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

  /// german
  final TLLanguageDataDe de;

  /// english
  final TLLanguageDataEn en;

  /// Default constructor
  const TLLanguageData({
    required this.de,
    required this.en
  });
}

/// Holds all german localized strings
class TLLanguageDataDe implements TLLocalizable {

  /// Default constructor
  const TLLanguageDataDe();

  @override
  String get userTypeAdminTitle => 'Admin';

  @override
  String get userTypeEmployeeTitle => 'Mitarbeiter*in';

  @override
  String get userTypeCustomerTitle => 'Kund*in';

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

/// Holds all english localized strings
class TLLanguageDataEn implements TLLocalizable {

  /// Default constructor
  const TLLanguageDataEn();

  @override
  String get userTypeAdminTitle => 'Admin';

  @override
  String get userTypeEmployeeTitle => 'Employee';

  @override
  String get userTypeCustomerTitle => 'Customer';

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