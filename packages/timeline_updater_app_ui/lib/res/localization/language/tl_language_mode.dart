/// An enum specifying the available language modes
enum TLLanguageMode {

  /// The system based language mode
  system(
    id: null
  ),

  /// The english language mode
  en(
    id: 1
  ),

  /// The german language mode
  de(
    id: 2
  );

  /// The id of the language mode
  final int? id;

  /// Default constructor
  const TLLanguageMode({
    this.id
  });

  /// Gets the language mode by the id
  static TLLanguageMode getLanguageModeById(int? id) {
    return TLLanguageMode.values.firstWhere((TLLanguageMode mode) => mode.id == id);
  }
}