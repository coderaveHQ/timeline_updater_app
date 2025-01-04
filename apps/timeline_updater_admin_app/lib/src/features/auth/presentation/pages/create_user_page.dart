import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/src/features/auth/presentation/app/create_user_page_state_notifier.dart';
import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_admin_app/core/res/theme/custom_colorable.dart';

/// The sign in page
class CreateUserPage extends StatefulHookConsumerWidget {

  /// Default constructor
  const CreateUserPage({ super.key });

  @override
  ConsumerState<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends ConsumerState<CreateUserPage> {

  /// Controller for the name text field
  late TextEditingController _nameController;

  /// Controller for the email text field
  late TextEditingController _emailController;

  /// Controller for the password text field
  late TextEditingController _passwordController;

  /// Controller for the service key text field
  late TextEditingController _serviceKeyController;

  /// Handles when the create user button is pressed
  Future<void> _handleCreateUser() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim().toLowerCase();
    final String password = _passwordController.text.trim();
    final String serviceKey = _serviceKeyController.text.trim();

    await ref.read(createUserPageStateNotifierProvider.notifier).createUser(
      name: name,
      email: email,
      password: password,
      serviceKey: serviceKey
    );

    
  }

  @override
  Widget build(BuildContext context) {

    _nameController = useTextEditingController();
    _emailController = useTextEditingController();
    _passwordController = useTextEditingController();
    _serviceKeyController = useTextEditingController();

    final CustomLocalizable language = TLLocalization.languageOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final CreateUserPageState pageState = ref.watch(createUserPageStateNotifierProvider);

    return TLScaffold(
      appBar: TLAppBar(
        title: language.createUserAppBarTitle,
        backButton: TLAppBarBackButton(isEnabled: !pageState.isCreateUserLoading)
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: context.topPadding + TLSpacing.lg,
            left: context.leftPadding + TLSpacing.lg + TLUIUtils.additionalPaddingForCenteredMaxWidth(context),
            right: context.rightPadding + TLSpacing.lg + TLUIUtils.additionalPaddingForCenteredMaxWidth(context),
            bottom: context.bottomPaddingOrZeroWhenKeyboard + TLSpacing.lg
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TLText(
                text: language.createUserTitle,
                alignment: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: colors.signInTitle
                )
              ),
              const Gap(TLSpacing.lg),
              TLText(
                text: language.createUserSubtitle,
                alignment: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: colors.signInSubtitle
                )
              ),
              const Gap(TLSpacing.xl),
              TLTextField(
                controller: _nameController,
                icon: LucideIcons.tag,
                hint: language.createUserNameTextFieldHint,
                isEnabled: !pageState.isCreateUserLoading,
                inputType: TextInputType.name
              ),
              const Gap(TLSpacing.lg),
              TLTextField(
                controller: _emailController,
                inputType: TextInputType.emailAddress,
                icon: LucideIcons.mail,
                hint: language.signInEmailTextFieldHint,
                isEnabled: !pageState.isCreateUserLoading
              ),
              const Gap(TLSpacing.lg),
              TLTextField(
                controller: _passwordController,
                obscure: true,
                icon: LucideIcons.lock,
                hint: language.signInPasswordTextFieldHint,
                isEnabled: !pageState.isCreateUserLoading
              ),
              const Gap(TLSpacing.lg),
              TLTextField(
                controller: _serviceKeyController,
                obscure: true,
                icon: LucideIcons.key,
                hint: language.createUserServiceKeyTextFieldHint,
                isEnabled: !pageState.isCreateUserLoading
              ),
              const Gap(TLSpacing.xl),
              TLRectangleButton(
                onPressed: _handleCreateUser,
                isLoading: pageState.isCreateUserLoading,
                isEnabled: !pageState.isCreateUserLoading,
                title: language.createUserCreateUserButtonTitle
              )
            ]
          )
        )
      )
    );
  }
}