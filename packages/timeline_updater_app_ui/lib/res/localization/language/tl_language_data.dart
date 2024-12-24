/// A class holding all available localizable strings
class TLLanguageData {

  /// This is just a test property
  final String test;

  /// Default constructor
  const TLLanguageData({
    required this.test
  });

  /// Holds all english values
  factory TLLanguageData.en() => const TLLanguageData(
    test: 'Test'
  );

  /// Holds all german values
  factory TLLanguageData.de() => const TLLanguageData(
    test: 'Test'
  );
}