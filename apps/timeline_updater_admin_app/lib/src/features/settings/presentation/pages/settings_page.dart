import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_admin_app/src/features/auth/presentation/widgets/sign_out_button.dart';

/// The settings page
class SettingsPage extends StatelessWidget {

  /// Default constructor
  const SettingsPage({ super.key });

  @override
  Widget build(BuildContext context) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    return TLScaffold(
      appBar: TLAppBar(
        navigationRailExists: true,
        title: translations.settingsAppBarTitle
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: TLSpacing.sm,
          right: context.rightPadding + TLSpacing.sm,
          top: TLSpacing.lg,
          bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg
        ),
        child: Column(
          children: [
            const SignOutButton()
          ]
        )
      )
    );
  }
}