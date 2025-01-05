import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on the DateTime object
extension DateTimeX on DateTime {

  /// Converts the DateTime object into a human readable string
  String toHumanReadable(BuildContext context, { bool withTime = true }) {
    final TLLanguageMode languageMode = TLLocalization.languageModeOf(context, specifySystem: true);
    if (languageMode == TLLanguageMode.de) { return _toHumanReadableDe(withTime: withTime); }
    else { return _toHumanReadableEn(withTime: withTime); }
  }

  /// German
  String _toHumanReadableDe({ bool withTime = true }) {
    String result = '${ day.toString().padLeft(2, '0') }.${ month.toString().padLeft(2, '0') }.${ year.toString().padLeft(4, '0') }';
    if (withTime) result += ' ${ hour.toString().padLeft(2, '0') }:${ minute.toString().padLeft(2, '0') }';
    return result;
  }

  /// English
  String _toHumanReadableEn({ bool withTime = true }) {
    String result = '${ month.toString().padLeft(2, '0') }-${ day.toString().padLeft(2, '0') }-${ year.toString().padLeft(4, '0') }';
    if (withTime) {
      final int hour12 = hour % 12 == 0 ? 12 : hour % 12;
      final String period = hour < 12 ? 'AM' : 'PM';
      result += ' ${ hour12.toString().padLeft(2, '0') }:${ minute.toString().padLeft(2, '0') } $period';
    }
    return result;
  }
}