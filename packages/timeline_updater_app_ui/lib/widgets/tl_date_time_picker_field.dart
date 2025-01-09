import 'package:flutter/material.dart';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app_ui/extensions/date_time_type_x.dart';
import 'package:timeline_updater_app_ui/extensions/date_time_x.dart';
import 'package:timeline_updater_app_ui/res/localization/language/tl_language_data.dart';
import 'package:timeline_updater_app_ui/res/localization/tl_localization.dart';
import 'package:timeline_updater_app_ui/res/theme/colors/tl_color_data.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/res/theme/tl_theme.dart';
import 'package:timeline_updater_app_ui/widgets/tl_text.dart';

/// A custom datetime picker field
class TLDateTimePickerField extends StatelessWidget {

  /// Wether the datetime picker can be opened
  final bool isEnabled;

  /// The text for when no datetime is specified, yet
  final String? emptyText;

  /// The minimum selectable DateTime
  final DateTime? minimum;

  /// The maximum selectable DateTime
  final DateTime? maximum;

  /// The initial DateTime
  final DateTime? initial;

  /// The currently selected DateTime
  final DateTime? current;

  /// The type of datetime picker to show
  final DateTimeType type;

  /// Callback for when a new date time was selected
  final void Function(DateTime)? onChanged;

  /// Default constructor
  const TLDateTimePickerField({ 
    super.key,
    this.isEnabled = true,
    this.emptyText,
    this.minimum,
    this.maximum,
    this.initial,
    this.current,
    required this.type,
    this.onChanged
  });

  Future<void> _onPressed(BuildContext context) async {
    final DateTime? newDateTime = await showDateTimePicker(
      context,
      type: type,
      initial: current ?? initial,
      minimum: minimum,
      maximum: maximum
    );

    if (newDateTime != null) onChanged?.call(newDateTime);
  }

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    return SizedBox(
      height: 52.0,
      child: RawMaterialButton(
        onPressed: isEnabled ? () => _onPressed(context) : null,
        enableFeedback: isEnabled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 0.0,
        focusElevation: 0.0,
        disabledElevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0.0,
        fillColor: colors.dateTimePickerFieldBackground,
        padding: const EdgeInsets.symmetric(horizontal: TLSpacing.md),
        child: Row(
          children: [
            Icon(
              LucideIcons.clock,
              size: 20.0,
              color: colors.textFieldIcon
            ),
            const Gap(TLSpacing.md),
            if (current != null || emptyText != null) Expanded(
              child: TLText(
                text: current?.toHumanReadable(context, type) ?? emptyText!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: current != null ? colors.dateTimePickerFieldForeground : colors.dateTimePickerFieldEmptyTextForeground
                )
              )
            )
          ]
        )
      )
    );
  }
}

/// Shows a date time picker
Future<DateTime?> showDateTimePicker(
    BuildContext context, {
    required DateTimeType type,
    DateTime? initial,
    DateTime? minimum,
    DateTime? maximum
  }) async {

    final TLColorable colors = TLTheme.colorsOf(context);
    final TLLocalizable translations = TLLocalization.translationsOf(context);
    final Locale locale = TLLocalization.languageModeOf(context, specifySystem: true).locale;

    return await showBoardDateTimePicker(
      context: context,
      useRootNavigator: false,
      pickerType: type.packageType,
      initialDate: initial,
      radius: 12.0,
      minimumDate: minimum,
      maximumDate: maximum,
      options: BoardDateTimeOptions(
        languages: BoardPickerLanguages(
          today: translations.dateTimePickerToday,
          tomorrow: translations.dateTimePickerTomorrow,
          now: translations.dateTimePickerNow,
          locale: locale.languageCode
        ),
        foregroundColor: colors.dateTimePickerForeground,
        backgroundColor: colors.dateTimePickerBackground,
        textColor: colors.dateTimePickerText,
        activeColor: colors.dateTimePickerActiveColor,
        activeTextColor: colors.dateTimePickerActiveTextColor,
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.dmy,
        pickerSubTitles: BoardDateTimeItemTitles(
          year: translations.dateTimePickerYear,
          month: translations.dateTimePickerMonth,
          day: translations.dateTimePickerDay,
          hour: translations.dateTimePickerHour,
          minute: translations.dateTimePickerMinute
        )
      )
    );
  }