import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/auth/presentation/app/custom_auth_state_notifier.dart';
import 'package:timeline_updater_admin_app/src/features/auth/presentation/pages/create_user_page.dart';
import 'package:timeline_updater_admin_app/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/pages/create_customer_page.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/pages/customer_details_page.dart';
import 'package:timeline_updater_admin_app/src/features/customers/presentation/pages/customers_page.dart';
import 'package:timeline_updater_admin_app/src/features/main/presentation/pages/main_page.dart';
import 'package:timeline_updater_admin_app/src/features/settings/presentation/pages/settings_page.dart';
import 'package:timeline_updater_admin_app/src/features/users/presentation/pages/users_page.dart';

part 'router.g.dart';

/// The application router
@riverpod
GoRouter router(Ref ref) {

  final CustomAuthState initialCustomAuthState = ref.read(customAuthStateNotifierProvider);
  final ValueNotifier<CustomAuthState> customAuthStateNotifier = ValueNotifier<CustomAuthState>(initialCustomAuthState);

  ref
    ..onDispose(customAuthStateNotifier.dispose)
    ..listen(customAuthStateNotifierProvider, 
      (CustomAuthState? last, CustomAuthState next) 
        => customAuthStateNotifier.value = next);

  // Construct the router
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashRoute.location,
    routes: $appRoutes,
    refreshListenable: customAuthStateNotifier,
    extraCodec: const ExtraCodec(),
    redirect: (BuildContext context, GoRouterState state) {
      final CustomAuthStatus currentCustomAuthStatus = customAuthStateNotifier.value.status;

      if (!currentCustomAuthStatus.allowedPaths.contains(state.fullPath)) {
        return currentCustomAuthStatus.redirectPath;
      }

      return null;
    }
  );

  // Dispose the router when the provider is disposed
  ref.onDispose(router.dispose);

  return router;
}

/// Extra Codec for the router
class ExtraCodec extends Codec<Object?, Object?> {

  /// Default Constructor
  const ExtraCodec();
  
  @override
  Converter<Object?, Object?> get decoder => const ExtraDecoder();
  
  @override
  Converter<Object?, Object?> get encoder => const ExtraEncoder();
}

/// Extra Decoder for the router
class ExtraDecoder extends Converter<Object?, Object?> {

  /// Default Constructor
  const ExtraDecoder();
  
  @override
  Object? convert(Object? input) {
    return null;
  }
}

/// Extra Encoder for the router
class ExtraEncoder extends Converter<Object?, Object?> {

  /// Default Constructor
  const ExtraEncoder();
  
  @override
  Object? convert(Object? input) {
    return null;
  }
}

/// The root navigator key
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
/// The shell navigator key
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

/// The splash route
@TypedGoRoute<SplashRoute>(path: SplashRoute.location)
class SplashRoute extends GoRouteData {

  /// Default constructor
  const SplashRoute();

  /// The location of the route
  static const String location = '/';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final CustomAuthState currentCustomAuthState = ProviderScope.containerOf(context).read(customAuthStateNotifierProvider);
    return currentCustomAuthState.status.redirectPath;
  }
}

/// The sign in route
@TypedGoRoute<SignInRoute>(path: SignInRoute.location)
class SignInRoute extends GoRouteData {

  /// Default constructor
  const SignInRoute();

  /// The location of the route
  static const String location = '/sign-in';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const SignInPage()
    );
  }
}

/// The create user route
@TypedGoRoute<CreateUserRoute>(path: CreateUserRoute.location)
class CreateUserRoute extends GoRouteData {

  /// Default constructor
  const CreateUserRoute();

  /// The location of the route
  static const String location = '/create-user';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const CreateUserPage()
    );
  }
}

/// The main route
@TypedShellRoute<MainRoute>(
  routes: [
    TypedGoRoute<UsersRoute>(path: UsersRoute.location),
    TypedGoRoute<CustomersRoute>(
      path: CustomersRoute.location,
      routes: [
        TypedGoRoute<CustomerDetailsRoute>(path: CustomerDetailsRoute.location),
      ]
    ),
    TypedGoRoute<SettingsRoute>(path: SettingsRoute.location)
  ]
)
class MainRoute extends ShellRouteData {

  /// Default constructor
  const MainRoute();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return NoTransitionPage(
      key: state.pageKey,
      child: MainPage(navigator: navigator)
    );
  }
}

/// The users route
class UsersRoute extends GoRouteData {

  /// The location of the route
  static const String location = '/users';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const UsersPage()
    );
  }
}

/// The customers route
class CustomersRoute extends GoRouteData {

  /// The location of the route
  static const String location = '/customers';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const CustomersPage()
    );
  }
}

/// The customer details route
class CustomerDetailsRoute extends GoRouteData {

  /// The id of the customer
  final String id;

  /// Default constructor
  const CustomerDetailsRoute(this.id);

  /// The location of the route
  static const String location = ':id';

  /// The full path of the route
  static const String path = '${ CustomersRoute.path }/$location';

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomerDetailsPage(id: id);
  }
}

/// The create customer route
@TypedGoRoute<CreateCustomerRoute>(path: CreateCustomerRoute.location)
class CreateCustomerRoute extends GoRouteData {

  /// Default constructor
  const CreateCustomerRoute();

  /// The location of the route
  static const String location = '/create-customer';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateCustomerPage();
  }
}

/// The settings route
class SettingsRoute extends GoRouteData {

  /// The location of the route
  static const String location = '/settings';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const SettingsPage()
    );
  }
}