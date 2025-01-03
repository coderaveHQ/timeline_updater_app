/// A class for additional functionalities regarding error handling
sealed class Result<T, E extends Object> {
  
  const Result();

  /// Adds the ability to give callbacks for both types of result
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(E error) onFailure,
  }) {
    if (this is Success<T, E>) {
      return onSuccess((this as Success<T, E>).data);
    } else {
      return onFailure((this as Failure<T, E>).error);
    }
  }

  /// A callback that will only fire for the result type `Success`
  R? onSuccess<R>(R? Function(T data) action) {
    if (this is Success<T, E>) {
      return action((this as Success<T, E>).data);
    }

    return null;
  }

  /// A callback that will only fire for the result type `Failure`
  R? onFailure<R>(R? Function(E error) action) {
    if (this is Failure<T, E>) {
      return action((this as Failure<T, E>).error);
    }

    return null;
  }
}

/// Defines the data structure of the `Success` type
class Success<T, E extends Object> extends Result<T, E> {

  /// The data received
  final T data;

  /// Default constructor
  const Success({ required this.data });
}

/// Defines the data structure of the `Failure` type
class Failure<T, E extends Object> extends Result<T, E> {

  /// The error that occured
  final E error;

  /// Default constructor
  const Failure({ required this.error });
}