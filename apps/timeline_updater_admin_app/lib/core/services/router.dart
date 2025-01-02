import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timeline_updater_admin_app/src/features/main/presentation/pages/main_page.dart';

part 'router.g.dart';

/// The application router
@riverpod
GoRouter router(Ref ref) {

  // Construct the router
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: MainRoute.location,
    routes: $appRoutes
  );

  // Dispose the router when the provider is disposed
  ref.onDispose(router.dispose);

  return router;
}

/// The root navigator key
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// The main route
@TypedGoRoute<MainRoute>(path: MainRoute.location)
class MainRoute extends GoRouteData {

  /// Default constructor
  const MainRoute();

  /// The location of the route
  static const String location = '/';

  /// The full path of the route
  static const String path = location;

  /// The parent navigator key
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainPage();
  }
}