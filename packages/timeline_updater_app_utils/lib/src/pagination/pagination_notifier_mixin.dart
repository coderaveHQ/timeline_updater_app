import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:timeline_updater_app_utils/src/extensions/async_value_x.dart';
import 'package:timeline_updater_app_utils/src/pagination/pagination_data.dart';
import 'package:timeline_updater_app_utils/src/result.dart';
import 'package:timeline_updater_app_utils/src/typedefs.dart';

/// An abstract mixin interface defining how notifiers should be designed
abstract interface class PaginationNotifierMixin<D extends PaginationData<T>, T> {

  /// The current state of the notifier
  AsyncValue<D> get state;

  /// Sets the state
  set state(AsyncValue<D> newState);

  // FIXME
  /// A provdier ref to work with inside the notifier
  AsyncNotifierProviderRef<D> get ref;

  /// Loads the initial data
  Future<D> initialLoad();

  /// Loads the next data
  Future<void> loadNext();

  /// Refreshes the notifier
  void forceRefresh();
}

///
abstract mixin class OffsetPaginationNotifierMixin<T, E extends Object> implements PaginationNotifierMixin<OffsetPaginationData<T>, T> {

  static const int _kPaginationLimit = 20;
  
  /// Fetches the actual data
  FutureResult<List<T>, E> fetch({ 
    required int offset
  });

  @override
  Future<OffsetPaginationData<T>> initialLoad() async {
    final Result<List<T>, E> next = await fetch(offset: 0);
    return next.fold<OffsetPaginationData<T>>(
      onSuccess: (List<T> data) {
        return OffsetPaginationData<T>(
          items: data,
          offset: _kPaginationLimit,
          hasMore: data.length == _kPaginationLimit
        );
      },
      onFailure: (E error) => throw error
    );
  }

  @override
  Future<void> loadNext() async {
    final OffsetPaginationData<T>? value = state.valueOrNull;
    if (value == null) return;

    if (value.hasMore) {
      state = AsyncLoading<OffsetPaginationData<T>>().copyWithPrevious(state);

      state = await state.guardPreservingPreviousOnError(() async {
        final Result<List<T>, E> next = await fetch(offset: value.offset + _kPaginationLimit);
        
        return next.fold<OffsetPaginationData<T>>(
          onSuccess: (List<T> data) {
            return value.copyWith(
              items: [...value.items, ...data],
              offset: value.offset + _kPaginationLimit,
              hasMore: data.length == _kPaginationLimit
            );
          }, 
          onFailure: (E error) => throw error
        );
      });
    }
  }

  @override
  void forceRefresh() {
    state = AsyncLoading<OffsetPaginationData<T>>();
    ref.invalidateSelf();
  }
}