/// An abstract class for defining paginated data
abstract class PaginationData<T> {

  /// A list of items
  List<T> get items;

  /// Wether there are more items to be fetched
  bool get hasMore;
}

/// An implementation of `PaginationData<T>` for offset pagination
class OffsetPaginationData<T> implements PaginationData<T> {

  @override
  final List<T> items;

  @override
  final bool hasMore;

  /// Stores the current offset
  final int offset;

  /// Default constructor
  const OffsetPaginationData({
    required this.items,
    required this.hasMore,
    this.offset = 0
  });

  /// Copies the current object with some new values
  OffsetPaginationData<T> copyWith({
    List<T>? items,
    bool? hasMore,
    int? offset
  }) {
    return OffsetPaginationData<T>(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      offset: offset ?? this.offset
    );
  }
}