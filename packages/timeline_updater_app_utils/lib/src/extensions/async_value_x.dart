import 'package:hooks_riverpod/hooks_riverpod.dart';

/// An extension on `AsyncValue<T>`
extension AsyncValueX<T> on AsyncValue<T> {
  
  /// guards and preserves the previous error
  Future<AsyncValue<T>> guardPreservingPreviousOnError(
    Future<T> Function() future
  ) async {
    try {
      return AsyncValue<T>.data(await future());
    } on Exception catch (e, s) {
      return AsyncValue<T>.error(e, s).copyWithPrevious(this);
    }
  }

  /// skips when error can be ignored
  R whenIgnorableError<R>({
    required R Function(
      T data, {
      required bool hasError,
      required bool isLoading,
      required Object? error,
    }) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    bool skipErrorOnHasValue = false
  }) {
    if (skipErrorOnHasValue) {
      if (hasValue && hasError) {
        return data(
          requireValue,
          hasError: true,
          isLoading: isLoading,
          error: this.error,
        );
      }
    }

    return when<R>(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: (T d) => data(d, hasError: hasError, isLoading: isLoading, error: this.error),
      error: error,
      loading: loading
    );
  }
}