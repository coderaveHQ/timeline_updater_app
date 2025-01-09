/// An extension on a generic type
extension GenericX<T, O> on T? {

  /// Allows doing something with an object if it is not null
  O? whenNotNull(O? Function(T) callback) {
    if (this == null) return null;
    return callback.call(this as T);
  }
}