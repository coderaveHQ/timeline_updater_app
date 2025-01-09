import 'package:board_datetime_picker/board_datetime_picker.dart';

import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

/// An extension on DateTimeType (package: board_datetime_picker)
extension DateTimeTypeX on DateTimeType {

  /// Gets the package type respectively
  DateTimePickerType get packageType {
    return switch (this) {
      DateTimeType.date => DateTimePickerType.date,
      DateTimeType.time => DateTimePickerType.time,
      DateTimeType.dateAndTime => DateTimePickerType.datetime
    };
  }
}