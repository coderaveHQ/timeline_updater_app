import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_updater_admin_app/core/services/router.dart';
import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/src/features/auth/presentation/app/custom_auth_state_notifier.dart';

/// A custom wrapper widget for displaying auth state changes
class CustomAuthStateWrapper extends ConsumerStatefulWidget {

  /// The widget to be displayed
  final Widget child;

  /// Default constructor
  const CustomAuthStateWrapper({
    super.key,
    required this.child
  });

  @override
  ConsumerState<CustomAuthStateWrapper> createState() => _CustomAuthStateWrapperState();
}

class _CustomAuthStateWrapperState extends ConsumerState<CustomAuthStateWrapper> {

  /// Handles the updates to the custom auth state
  void _handleCustomAuthStateUpdates(CustomAuthState? last, CustomAuthState next) {
    // This context is used to get the context of the root navigator wrapping the App widget
    final BuildContext rootNavigatorContext = rootNavigatorKey.currentState!.context;

    if (next.error != null) {
      next.error!.showErrorToast(rootNavigatorContext);
    } else if (last?.status == CustomAuthStatus.unauthenticated && next.status == CustomAuthStatus.authenticated) {
      TLToasts.success.signedIn.show(rootNavigatorContext);
    } else if (last?.status == CustomAuthStatus.authenticated && next.status == CustomAuthStatus.unauthenticated)  {
      TLToasts.success.signedOut.show(rootNavigatorContext);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(customAuthStateNotifierProvider, _handleCustomAuthStateUpdates);
    return widget.child;
  }
}