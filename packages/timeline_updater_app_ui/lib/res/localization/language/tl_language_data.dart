/// A class holding all localizable strings
abstract class TLLocalizable {

  /// The title for the system color mode
  String get colorModeSystemTitle;

  /// The title for the light color mode
  String get colorModeLightTitle;

  /// The title for the dark color mode
  String get colorModeDarkTitle;

  /// The title for the system language mode
  String get languageModeSystemTitle;

  /// The title for the german language mode
  String get languageModeDeTitle;

  /// The title for the english language mode
  String get languageModeEnTitle;

  /// The title of the admin user type
  String get userTypeAdminTitle;

  /// The title of the employee user type
  String get userTypeEmployeeTitle;

  /// The title of the customer user type
  String get userTypeCustomerTitle;

  /// The title of the server standard type
  String get standardTypeServer;

  /// The title of the client standard type
  String get standardTypeClient;

  /// The title of the E3 standard evolution
  String get standardEvolutionE3;

  /// The title of the v15 standard version
  String get standardVersionV15;

  /// The title of the v15.5 standard version
  String get standardVersionV15_5;

  /// The title of the v16 standard version
  String get standardVersionV16;

  /// The title of the standard flavor plastics
  String get standardFlavorEnterprise;

  /// The title of the standard flavor plastics
  String get standardFlavorPlastics;

  /// The title of the standard flavor neo
  String get standardFlavorNeo;

  /// The title of the standard flavor components
  String get standardFlavorComponents;

  /// The title of the standard flavor electronics
  String get standardFlavorElectronics;

  /// The title of the standard flavor guss
  String get standardFlavorGuss;

  /// The title of then update status upcoming
  String get updateStatusUpcoming;
  
  /// The title of then update status ongoing
  String get updateStatusOngoing;

  /// The title of then update status success
  String get updateStatusSuccess;

  /// The title of then update status warning
  String get updateStatusWarning;

  /// The title of then update status error
  String get updateStatusError;

  /// The title of the cancel button
  String get dialogCancelButtonTitle;

  /// Represents the text "today"
  String get dateTimePickerToday;

  /// Represents the text "tomorrow"
  String get dateTimePickerTomorrow;

  /// Represents the text "now"
  String get dateTimePickerNow;

  /// Represents the text "year"
  String get dateTimePickerYear;

  /// Represents the text "month"
  String get dateTimePickerMonth;

  /// Represents the text "day"
  String get dateTimePickerDay;

  /// Represents the text "hour"
  String get dateTimePickerHour;

  /// Represents the text "minute"
  String get dateTimePickerMinute;

  /// Settings app bar title
  String get settingsAppBarTitle;

  /// The page description of the settings page
  String get settingsDescription;

  /// The appearance section title for the settings page
  String get settingsAppearanceSectionTitle;

  /// The appearance section description for the settings page
  String get settingsAppearanceSectionDescription;

  /// The theme section item title for the settings page
  String get settingsAppearanceSectionItemThemeTitle;

  /// The localization section title for the settings page
  String get settingsLocalizationSectionTitle;

  /// The localization section description for the settings page
  String get settingsLocalizationSectionDescription;

  /// The language section item title for the settings page
  String get settingsLocalizationSectionItemLanguageTitle;

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

  /// ValidationError.noStandardFileSelected
  String get validationErrorNoStandardFileSelected;

  /// ValidationError.invalidStandardFileExtension
  String get validationErrorInvalidStandardFileExtension;

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
  String get colorModeSystemTitle => 'System';

  @override
  String get colorModeLightTitle => 'Hell';

  @override
  String get colorModeDarkTitle => 'Dunkel';

  @override
  String get languageModeSystemTitle => 'System';

  @override
  String get languageModeDeTitle => 'Deutsch';

  @override
  String get languageModeEnTitle => 'Englisch';

  @override
  String get userTypeAdminTitle => 'Admin';

  @override
  String get userTypeEmployeeTitle => 'Mitarbeiter*in';

  @override
  String get userTypeCustomerTitle => 'Kund*in';

  @override
  String get standardTypeServer => 'Server';

  @override
  String get standardTypeClient => 'Client';

  @override
  String get standardEvolutionE3 => 'E3';

  @override
  String get standardVersionV15 => 'v15';

  @override
  String get standardVersionV15_5 => 'v15.5';

  @override
  String get standardVersionV16 => 'v16';

  @override
  String get standardFlavorEnterprise => 'Enterprise';

  @override
  String get standardFlavorPlastics => 'Plastics';

  @override
  String get standardFlavorNeo => 'Neo';

  @override
  String get standardFlavorComponents => 'Components';

  @override
  String get standardFlavorElectronics => 'Electronics';

  @override
  String get standardFlavorGuss => 'Guss';

  @override
  String get updateStatusUpcoming => 'Anstehend';
  
  @override
  String get updateStatusOngoing => 'Laufend';

  @override
  String get updateStatusSuccess => 'Erfolgreich';

  @override
  String get updateStatusWarning => 'Warnung';

  @override
  String get updateStatusError => 'Fehlerhaft';

  @override
  String get dialogCancelButtonTitle => 'Abbrechen';

  @override
  String get dateTimePickerToday => 'Heute';

  @override
  String get dateTimePickerTomorrow => 'Morgen';

  @override
  String get dateTimePickerNow => 'Jetzt';

  @override
  String get dateTimePickerYear => 'Jahr';

  @override
  String get dateTimePickerMonth => 'Monat';

  @override
  String get dateTimePickerDay => 'Tag';

  @override
  String get dateTimePickerHour => 'Stunde';

  @override
  String get dateTimePickerMinute => 'Minute';

  @override
  String get settingsAppBarTitle => 'Einstellungen';

  @override
  String get settingsDescription => 'Sieh dir deine Einstellungen an und passe sie nach deinem Geschmack an.';

  @override
  String get settingsAppearanceSectionTitle => 'Darstellung';

  @override
  String get settingsAppearanceSectionDescription => 'Hier kannst du die Software ganz nach deinen Belieben gestalten.';

  @override
  String get settingsAppearanceSectionItemThemeTitle => 'Thema';

  @override
  String get settingsLocalizationSectionTitle => 'Lokalisierung';

  @override
  String get settingsLocalizationSectionDescription => 'Für den Fall, dass wir deine Sprache falsch eingestellt haben, kannst du sie hier umstellen.';

  @override
  String get settingsLocalizationSectionItemLanguageTitle => 'Sprache';

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
  String get validationErrorNoStandardFileSelected => 'Eine Standard-Datei muss ausgewählt werden.';

  @override
  String get validationErrorInvalidStandardFileExtension => 'Diese Dateiendung hat keinen Support.';

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
  String get colorModeSystemTitle => 'System';

  @override
  String get colorModeLightTitle => 'Light';

  @override
  String get colorModeDarkTitle => 'Dark';

  @override
  String get languageModeSystemTitle => 'System';

  @override
  String get languageModeDeTitle => 'German';

  @override
  String get languageModeEnTitle => 'English';

  @override
  String get userTypeAdminTitle => 'Admin';

  @override
  String get userTypeEmployeeTitle => 'Employee';

  @override
  String get userTypeCustomerTitle => 'Customer';

  @override
  String get standardTypeServer => 'Server';

  @override
  String get standardTypeClient => 'Client';

  @override
  String get standardEvolutionE3 => 'E3';

  @override
  String get standardVersionV15 => 'v15';

  @override
  String get standardVersionV15_5 => 'v15.5';

  @override
  String get standardVersionV16 => 'v16';

  @override
  String get standardFlavorEnterprise => 'Enterprise';

  @override
  String get standardFlavorPlastics => 'Plastics';

  @override
  String get standardFlavorNeo => 'Neo';

  @override
  String get standardFlavorComponents => 'Components';

  @override
  String get standardFlavorElectronics => 'Electronics';

  @override
  String get standardFlavorGuss => 'Guss';

  @override
  String get updateStatusUpcoming => 'Upcoming';
  
  @override
  String get updateStatusOngoing => 'Ongoing';

  @override
  String get updateStatusSuccess => 'Success';

  @override
  String get updateStatusWarning => 'Warning';

  @override
  String get updateStatusError => 'Error';

  @override
  String get dialogCancelButtonTitle => 'Cancel';

  @override
  String get dateTimePickerToday => 'Today';

  @override
  String get dateTimePickerTomorrow => 'Tomorrow';

  @override
  String get dateTimePickerNow => 'Now';

  @override
  String get dateTimePickerYear => 'Year';

  @override
  String get dateTimePickerMonth => 'Month';

  @override
  String get dateTimePickerDay => 'Day';

  @override
  String get dateTimePickerHour => 'Hour';

  @override
  String get dateTimePickerMinute => 'Minute';

  @override
  String get settingsAppBarTitle => 'Settings';

  @override
  String get settingsDescription => 'View your settings and adjust them to your needs.';

  @override
  String get settingsAppearanceSectionTitle => 'Appearance';

  @override
  String get settingsAppearanceSectionDescription => 'Here you can customize the software to your liking.';

  @override
  String get settingsAppearanceSectionItemThemeTitle => 'Theme';

  @override
  String get settingsLocalizationSectionTitle => 'Localization';

  @override
  String get settingsLocalizationSectionDescription => 'In case we have set your language incorrectly, you can change it here.';

  @override
  String get settingsLocalizationSectionItemLanguageTitle => 'Language';

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
  String get validationErrorNoStandardFileSelected => 'A standard file needs to be selected.';

  @override
  String get validationErrorInvalidStandardFileExtension => 'The file has an unsupported file extension.';

  @override
  String get launchErrorUrlNotOpened => 'The URL could not be opened.';

  @override
  String get unknownErrorMessage => 'An unknown error occured';
}