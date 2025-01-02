/// An enum specifying the available color modes
enum TLColorMode {

  /// The color mode system
  system(
    id: null
  ),
  /// The color mode light
  light(
    id: 1
  ),
  /// The color mode dark
  dark(
    id: 2
  );

  /// The id of the color mode
  final int? id;

  /// Default constructor
  const TLColorMode({
    this.id
  });

  /// Gets the color mode by the id
  static TLColorMode getColorModeById(int? id) {
    return TLColorMode.values.firstWhere((TLColorMode mode) => mode.id == id);
  }
}