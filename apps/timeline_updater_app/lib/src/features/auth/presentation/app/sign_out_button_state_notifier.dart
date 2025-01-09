import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_app/src/features/auth/presentation/app/custom_auth_state_notifier.dart';

part 'sign_out_button_state_notifier.g.dart';

/// State notifier for the sign out button
@riverpod
class SignOutButtonStateNotifier extends _$SignOutButtonStateNotifier {

  @override
  SignOutButtonState build() => SignOutButtonState.initial();

  /// Signs out the currently signed in user
  Future<void> signOut() async {
    state = state.copyWith(
      isSignOutLoading: true,
      removeError: true
    );

    try {
      await ref.read(customAuthStateNotifierProvider.notifier).signOut();
      state = state.copyWith(isSignOutLoading: false);
    } catch (e) {
      state = state.copyWith(
        isSignOutLoading: false,
        error: e
      );
    }
  }
}

/// The state of the sign out button
class SignOutButtonState {

  /// Wether is loading to sign out
  final bool isSignOutLoading;

  /// Optional error
  final Object? error;

  /// Default constructor
  const SignOutButtonState({
    this.isSignOutLoading = false,
    this.error
  });

  /// Constructor for the initial state
  const SignOutButtonState.initial()
    : isSignOutLoading = false,
      error = null;

  /// Method to overwrite the current state with new values
  SignOutButtonState copyWith({
    bool? isSignOutLoading,
    Object? error,
    bool removeError = false
  }) {
    return SignOutButtonState(
      isSignOutLoading: isSignOutLoading ?? this.isSignOutLoading,
      error: removeError ? null : error ?? this.error
    );
  }
}