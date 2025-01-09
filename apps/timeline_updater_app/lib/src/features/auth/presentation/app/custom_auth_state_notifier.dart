import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/auth/domain/usecases/auth_sign_out_usecase.dart';
import 'package:timeline_updater_app/src/features/auth/domain/usecases/auth_sign_in_usecase.dart';
import 'package:timeline_updater_app/core/services/router.dart';

part 'custom_auth_state_notifier.g.dart';

/// Notifier for the authentication state
@riverpod
class CustomAuthStateNotifier extends _$CustomAuthStateNotifier {

  late final StreamSubscription<SupabaseAuthState> _supabaseAuthStateSubscription;

  @override
  CustomAuthState build() {
    initSupabaseAuthListener();

    ref.onDispose(() {
      _supabaseAuthStateSubscription.cancel();
    });

    return CustomAuthState.fromCurrentSupabaseAuthState();
  }

  /// Initializes the Supabase auth stream
  void initSupabaseAuthListener() {
    _supabaseAuthStateSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((SupabaseAuthState supabaseAuthState) {
      state = CustomAuthState.fromSupabaseAuthSession(supabaseAuthState.session);
    });
  }

  /// Signs in a user
  Future<void> signIn({
    required String email,
    required String password
  }) async {
    state = state.copyWith(
      isLoading: true,
      removeError: true
    );

    try {
      Validator.validateEmail(email);
      Validator.validatePassword(password);

      final AuthSignInUsecaseParams params = AuthSignInUsecaseParams(
        email: email,
        password: password
      );
      
      final Result<void, Object> result = await ref.watch(authSignInUsecaseProvider).call(params);

      result.fold<void>(
        onSuccess: (void _) => state = state.copyWith(isLoading: false),
        onFailure: (Object error) => throw error
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e
      );
      rethrow;
    }
  }

  /// Signs out the currently signed in user
  Future<void> signOut() async {
    state = state.copyWith(
      isLoading: true,
      removeError: true
    );

    final Result<void, Object> result = await ref.watch(authSignOutUsecaseProvider).call();

    result.fold<void>(
      onSuccess: (void _) => state = state.copyWith(isLoading: false),
      onFailure: (Object error) {
        state = state.copyWith(
          isLoading: false,
          error: error
        );
        throw error;
      }
    );
  }
}

/// Status of the authentication
enum CustomAuthStatus {

  /// unauthenticated
  unauthenticated(
    redirectPath: SignInRoute.path,
    allowedPaths: <String>[
      SignInRoute.path
    ]
  ),

  /// authenticated
  authenticated(
    redirectPath: UpdatesRoute.path,
    allowedPaths: <String>[
      UpdatesRoute.path,
      StandardsRoute.path,
      UploadStandardRoute.path,
      SettingsRoute.path
    ]
  );

  /// Redirect path
  final String redirectPath;

  /// All allowed paths of the current status
  final List<String> allowedPaths;

  /// Default constructor
  const CustomAuthStatus({
    required this.redirectPath,
    required this.allowedPaths
  });
}

/// Represents a custom authentication state
class CustomAuthState {

  /// The status of the authentication state
  final CustomAuthStatus status;

  /// Wether something is loading to change the state
  final bool isLoading;

  /// An optional error
  final Object? error;

  /// Default constructor
  const CustomAuthState({
    required this.status,
    this.isLoading = false,
    this.error
  });

  /// Creates an instance from a Supabase auth session
  factory CustomAuthState.fromSupabaseAuthSession(SupabaseAuthSession? supabaseAuthSession) {
    final CustomAuthStatus status = supabaseAuthSession == null ? CustomAuthStatus.unauthenticated : CustomAuthStatus.authenticated;
    return CustomAuthState(
      status: status,
      isLoading: false,
      error: null
    );
  }

  /// Creates an instance from a Supabase auth state
  factory CustomAuthState.fromCurrentSupabaseAuthState() {
    return CustomAuthState.fromSupabaseAuthSession(Supabase.instance.client.auth.currentSession);
  }

  /// Copies the current state with some new values
  CustomAuthState copyWith({
    CustomAuthStatus? status,
    bool? isLoading,
    Object? error,
    bool removeError = false
  }) {
    return CustomAuthState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      error: removeError ? null : error ?? this.error
    );
  }
}