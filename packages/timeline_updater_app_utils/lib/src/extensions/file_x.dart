import 'dart:io';

/// An extension on File
extension FileX on File {

  /// Gets the filename with the extension
  String get fileName {
    return path.split(Platform.pathSeparator).last;
  }

  /// Gets the file extension
  String get fileExtension {
    return path.split('.').last;
  }
}