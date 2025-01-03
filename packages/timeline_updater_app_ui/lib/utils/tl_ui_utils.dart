import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/extensions/build_context_x.dart';
import 'package:timeline_updater_app_ui/res/theme/spacing/tl_spacing.dart';
import 'package:timeline_updater_app_ui/utils/constants/tl_ui_constants.dart';

/// A class containing utils for the UI
class TLUIUtils {

  /// Gets the padding that is added to both sides to allow scrolling out of the range of any widget
  static double additionalPaddingForCenteredMaxWidth(BuildContext context) {
    double additionalHorizontalPadding = (context.screenWidth - context.leftPadding - context.rightPadding - 2 * TLSpacing.lg - TLUIConstants.maxWidthBreakpoint) / 2;
    if (additionalHorizontalPadding < 0.0) additionalHorizontalPadding = 0.0;
    return additionalHorizontalPadding;
  }
}