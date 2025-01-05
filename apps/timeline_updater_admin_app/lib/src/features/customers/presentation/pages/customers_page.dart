import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_admin_app/core/res/localization/custom_localizable.dart';

/// The customers page
class CustomersPage extends StatelessWidget {

  /// Default constructor
  const CustomersPage({ super.key });

  @override
  Widget build(BuildContext context) {

    final CustomLocalizable translations = TLLocalization.translationsOf(context);

    return TLScaffold(
      appBar: TLAppBar(
        navigationRailExists: true,
        title: translations.customersAppBarTitle
      )
    );
  }
}