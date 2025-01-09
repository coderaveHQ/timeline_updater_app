import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/src/features/main/presentation/widgets/main_top_bar.dart';
import 'package:timeline_updater_app/core/utils/constants/web_constants.dart';
import 'package:timeline_updater_app/core/res/localization/custom_localizable.dart';
import 'package:timeline_updater_app/core/res/custom_assets.dart';
import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';
import 'package:timeline_updater_app/core/services/router.dart';

/// The main page that contains of the navigation bar and the actual navigator
class MainPage extends StatelessWidget {

  /// The widget to be displayed based on the current route
  final Widget navigator;

  /// Default constructor
  const MainPage({ 
    super.key,
    required this.navigator
  });

  void _handleUpdates(BuildContext context) {
    UpdatesRoute().go(context);
  }

  void _handleSettings(BuildContext context) {
    SettingsRoute().go(context);
  }

  void _handleStandards(BuildContext context) {
    StandardsRoute().go(context);
  }

  Future<void> _handleDocumentation(BuildContext context) async {
    await TLCoreUtils.openURL(context, uri: WebConstants.documentationUrl);
  }

  Future<void> _handleWebApp(BuildContext context) async {
    await TLCoreUtils.openURL(context, uri: WebConstants.webAppUrl);
  }

  @override
  Widget build(BuildContext context) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);
    final CustomColorable colors = TLTheme.colorsOf(context);

    final String currentPath = GoRouterState.of(context).uri.toString();

    return TLScaffold(
      backgroundColor: colors.secondaryBackground,
      body: Row(
        children: [
          TLNavigationRail(
            logoPath: CustomAssets.logo, 
            appName: 'TLU',
            appVersion: '1.0.0',
            navigationItems: <TLNavigationRailItem>[
              TLNavigationRailItem(
                onPressed: () => _handleUpdates(context),
                title: translations.navigationRailUpdatesTitle,
                leadingIcon: LucideIcons.user,
                isSelected: currentPath == UpdatesRoute.path
              ),
              TLNavigationRailItem(
                onPressed: () => _handleStandards(context),
                title: translations.navigationRailStandardsTitle,
                leadingIcon: LucideIcons.file,
                isSelected: currentPath == StandardsRoute.path
              )
            ],
            bottomItems: [
              TLNavigationRailItem(
                onPressed:  () => _handleSettings(context),
                title: translations.navigationRailSettingsTitle,
                leadingIcon: LucideIcons.settings,
                isSelected: currentPath == SettingsRoute.path
              ),
              TLNavigationRailItem(
                onPressed: () => _handleDocumentation(context),
                title: translations.navigationRailDocumentationTitle,
                leadingIcon: LucideIcons.book,
                trailingIcon: LucideIcons.externalLink,
                isSelected: false
              ),
              TLNavigationRailItem(
                onPressed: () => _handleWebApp(context),
                title: translations.navigationRailWebAppTitle,
                leadingIcon: LucideIcons.earth,
                trailingIcon: LucideIcons.externalLink,
                isSelected: false
              )
            ]
          ),
          Expanded(
            child: Column(
              children: [
                MainTopBar(),
                Expanded(child: navigator)
              ]
            )
          )
        ]
      )
    );
  }
}