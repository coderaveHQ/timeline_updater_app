import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_customer_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_customer_app/src/features/auth/presentation/app/sign_out_button_state_notifier.dart';

/// The sign out button widget
class SignOutButton extends ConsumerStatefulWidget {

  /// Default constructor
  const SignOutButton({ super.key });

  @override
  ConsumerState<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends ConsumerState<SignOutButton> {

  Future<void> _handleSignOut() async {
    await ref.read(signOutButtonStateNotifierProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    final SignOutButtonState buttonState = ref.watch(signOutButtonStateNotifierProvider);

    return TLRectangleButton(
      onPressed: _handleSignOut,
      title: translations.signOutButtonTitle,
      isLoading: buttonState.isSignOutLoading,
      isEnabled: !buttonState.isSignOutLoading
    );
  }
}