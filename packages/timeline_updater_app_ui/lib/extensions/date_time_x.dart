import 'package:flutter/material.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/res/localization/language/tl_language_mode.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';

/// An extension on the DateTime object
extension DateTimeX on DateTime {

  /// Converts the DateTime object into a human readable string
  String toHumanReadable(BuildContext context, DateTimeType type) {
    final TLLanguageMode languageMode = TLLocalization.languageModeOf(context, specifySystem: true);
    if (languageMode == TLLanguageMode.de) { return _toHumanReadableDe(type); }
    else { return _toHumanReadableEn(type); }
  }

  /// German
  String _toHumanReadableDe(DateTimeType type) {
    String dateString = '${ day.toString().padLeft(2, '0') }.${ month.toString().padLeft(2, '0') }.${ year.toString().padLeft(4, '0') }';
    if (type == DateTimeType.date) return dateString;

    String timeString = '${ hour.toString().padLeft(2, '0') }:${ minute.toString().padLeft(2, '0') }';
    if (type == DateTimeType.time) return timeString;

    return '$dateString $timeString';
  }

  /// English
  String _toHumanReadableEn(DateTimeType type) {
    String dateString = '${ month.toString().padLeft(2, '0') }-${ day.toString().padLeft(2, '0') }-${ year.toString().padLeft(4, '0') }';
    if (type == DateTimeType.date) return dateString;

    final int hour12 = hour % 12 == 0 ? 12 : hour % 12;
    final String period = hour < 12 ? 'AM' : 'PM';
    String timeString = '${ hour12.toString().padLeft(2, '0') }:${ minute.toString().padLeft(2, '0') } $period';
    if (type == DateTimeType.time) return timeString;

    return '$dateString $timeString';
  }
}