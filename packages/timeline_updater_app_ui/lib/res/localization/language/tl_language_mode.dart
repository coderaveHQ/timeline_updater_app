/// An enum specifying the available language modes
enum TLLanguageMode {

  /// The system based language mode
  system(
    id: null
  ),

  /// The en-US language mode
  enUS(
    id: 1
  ),

  /// The de-DE language mode
  deDE(
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