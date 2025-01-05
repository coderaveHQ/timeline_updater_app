import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on `UserType`
extension UserTypeX on UserType {

  /// Gets the translated title of the user type
  String title(BuildContext context) {
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    
    return switch (this) {
      UserType.admin => translations.userTypeAdminTitle,
      UserType.employee => translations.userTypeEmployeeTitle,
      UserType.customer => translations.userTypeCustomerTitle
    };
  }

  /// Gets the typical color of each user type
  Color color(BuildContext context) {
    final TLColorable colors = TLTheme.colorsOf(context);

    return switch (this) {
      UserType.admin => colors.userTypeAdmin,
      UserType.employee => colors.userTypeEmployee,
      UserType.customer => colors.userTypeCustomer
    };
  }
}