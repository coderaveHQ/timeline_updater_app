import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/auth/presentation/app/custom_auth_state_notifier.dart';

part 'create_user_page_state_notifier.g.dart';

/// Notifier for the state of the create user page
@riverpod
class CreateUserPageStateNotifier extends _$CreateUserPageStateNotifier {

  @override
  CreateUserPageState build() => CreateUserPageState.initial();

  /// Creates a new user
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String serviceKey
  }) async {
    state = state.copyWith(
      isCreateUserLoading: true,
      removeError: false
    );

    try {
      await ref.read(customAuthStateNotifierProvider.notifier).createUser(
        name: name,
        email: email,
        password: password,
        serviceKey: serviceKey
      );

      state = state.copyWith(isCreateUserLoading: false);
    } catch (e) {
      state = state.copyWith(
        isCreateUserLoading: false,
        error: e
      );
    }
  }
}

/// The state of the create user page
class CreateUserPageState {

  /// Wether is loading to sign in
  final bool isCreateUserLoading;

  /// Optional error
  final Object? error;

  /// Default constructor
  const CreateUserPageState({
    this.isCreateUserLoading = false,
    this.error
  });

  /// Constructor for the initial state
  const CreateUserPageState.initial()
    : isCreateUserLoading = false,
      error = null;

  /// Method to overwrite the current state with new values
  CreateUserPageState copyWith({
    bool? isCreateUserLoading,
    Object? error,
    bool removeError = false
  }) {
    return CreateUserPageState(
      isCreateUserLoading: isCreateUserLoading ?? this.isCreateUserLoading,
      error: removeError ? null : error ?? this.error
    );
  }
}