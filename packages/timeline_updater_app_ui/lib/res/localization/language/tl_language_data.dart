/// A class holding all localizable strings
abstract class TLLocalizable {

  /// This is for test purposes only
  String test1();
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
  String test1() {
    return 'Test 1 (de-DE)';
  }
}

/// Holds all en-US localized strings
class TLLanguageDataEnUS implements TLLocalizable {

  /// Default constructor
  const TLLanguageDataEnUS();

  @override
  String test1() {
    return 'Test 1 (en-US)';
  }
}