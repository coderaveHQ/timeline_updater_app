import 'package:timeline_updater_app_utils/src/result.dart';
import 'package:timeline_updater_app_utils/src/typedefs.dart';

/// A usecase without any parameters
abstract class UsecaseWithoutParams<T, E extends Object> {

  /// Default constructor
  const UsecaseWithoutParams();

  /// Calls the given usecase
  Result<T, E> call();
}

/// A usecase with parameters
abstract class UsecaseWithParams<T, E extends Object, P> {

  /// Default constructor
  const UsecaseWithParams();

  /// Calls the given usecase
  Result<T, E> call(P params);
}

/// A usecase in a Future without any parameters
abstract class FutureUsecaseWithoutParams<T, E extends Object> {

  /// Default constructor
  const FutureUsecaseWithoutParams();

  /// Calls the given usecase
  FutureResult<T, E> call();
}

/// A usecase in a Future with parameters
abstract class FutureUsecaseWithParams<T, E extends Object, P> {

  /// Default constructor
  const FutureUsecaseWithParams();

  /// Calls the given usecase
  FutureResult<T, E> call(P params);
}