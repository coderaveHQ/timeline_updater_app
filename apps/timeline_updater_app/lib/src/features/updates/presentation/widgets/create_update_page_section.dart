import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

import 'package:timeline_updater_app/core/res/theme/custom_colorable.dart';

/// A section of the page
class CreateUpdatePageSection extends StatelessWidget {

  /// The title of the section
  final String title;

  /// The child to display
  final Widget child;

  /// Default constructor
  const CreateUpdatePageSection({
    super.key,
    required this.title,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    final CustomColorable colors = TLTheme.colorsOf(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TLText(
          text: title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: colors.uploadStandardDialogSectionTitle
          )
        ),
        const Gap(TLSpacing.lg),
        child
      ]
    );
  }
}