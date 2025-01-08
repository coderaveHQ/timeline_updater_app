import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_customer_app/src/features/auth/presentation/app/custom_auth_state_notifier.dart';

part 'sign_in_page_state_notifier.g.dart';

/// Notifier for the state of the sign in page
@riverpod
class SignInPageStateNotifier extends _$SignInPageStateNotifier {

  @override
  SignInPageState build() => SignInPageState.initial();

  /// Signs in the user
  Future<void> signIn({
    required String email,
    required String password
  }) async {
    state = state.copyWith(
      isSignInLoading: true,
      removeError: false
    );

    try {
      await ref.read(customAuthStateNotifierProvider.notifier).signIn(
        email: email,
        password: password
      );
      state = state.copyWith(isSignInLoading: false);
    } catch (e) {
      state = state.copyWith(
        isSignInLoading: false,
        error: e
      );
    }
  }
}

/// The state of the sign in page
class SignInPageState {

  /// Wether is loading to sign in
  final bool isSignInLoading;

  /// Optional error
  final Object? error;

  /// Default constructor
  const SignInPageState({
    this.isSignInLoading = false,
    this.error
  });

  /// Constructor for the initial state
  const SignInPageState.initial()
    : isSignInLoading = false,
      error = null;

  /// Method to overwrite the current state with new values
  SignInPageState copyWith({
    bool? isSignInLoading,
    Object? error,
    bool removeError = false
  }) {
    return SignInPageState(
      isSignInLoading: isSignInLoading ?? this.isSignInLoading,
      error: removeError ? null : error ?? this.error
    );
  }
}