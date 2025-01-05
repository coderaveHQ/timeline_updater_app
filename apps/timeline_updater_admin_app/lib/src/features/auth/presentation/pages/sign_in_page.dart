import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/src/features/auth/presentation/app/sign_in_page_state_notifier.dart';
import 'package:timeline_updater_admin_app/core/res/custom_assets.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';

/// The sign in page
class SignInPage extends StatefulHookConsumerWidget {

  /// Default constructor
  const SignInPage({ super.key });

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {

  /// Controller for the email text field
  late TextEditingController _emailController;

  /// Controller for the password text field
  late TextEditingController _passwordController;

  /// Handles when the sign in button is pressed
  Future<void> _handleSignIn() async {
    final String email = _emailController.text.trim().toLowerCase();
    final String password = _passwordController.text.trim();

    await ref.read(signInPageStateNotifierProvider.notifier).signIn(
      email: email,
      password: password
    );
  }

  @override
  Widget build(BuildContext context) {

    _emailController = useTextEditingController();
    _passwordController = useTextEditingController();

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final SignInPageState pageState = ref.watch(signInPageStateNotifierProvider);

    return TLScaffold(
      appBar: TLAppBar(title: translations.signInAppBarTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: TLSpacing.lg,
          left: context.leftPadding + TLSpacing.lg + TLUIUtils.additionalPaddingForCenteredMaxWidth(context),
          right: context.rightPadding + TLSpacing.lg + TLUIUtils.additionalPaddingForCenteredMaxWidth(context),
          bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TLMaxSize.size(
              size: const Size.square(160.0), 
              child: Image.asset(
                CustomAssets.logo,
                width: context.screenWidth / 2.8,
                height: context.screenWidth / 2.8
              )
            ),
            const Gap(TLSpacing.xxl),
            TLText(
              text: translations.signInTitle,
              alignment: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
                color: colors.signInTitle
              )
            ),
            const Gap(TLSpacing.lg),
            TLText(
              text: translations.signInSubtitle,
              alignment: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: colors.signInSubtitle
              )
            ),
            const Gap(TLSpacing.xl),
            TLTextField(
              controller: _emailController,
              inputType: TextInputType.emailAddress,
              icon: LucideIcons.mail,
              hint: translations.signInEmailTextFieldHint,
              isEnabled: !pageState.isSignInLoading
            ),
            const Gap(TLSpacing.lg),
            TLTextField(
              controller: _passwordController,
              obscure: true,
              icon: LucideIcons.lock,
              hint: translations.signInPasswordTextFieldHint,
              isEnabled: !pageState.isSignInLoading
            ),
            const Gap(TLSpacing.xl),
            TLRectangleButton(
              onPressed: _handleSignIn,
              isLoading: pageState.isSignInLoading,
              isEnabled: !pageState.isSignInLoading,
              title: translations.signInSignInButtonTitle
            )
          ]
        )
      )
    );
  }
}