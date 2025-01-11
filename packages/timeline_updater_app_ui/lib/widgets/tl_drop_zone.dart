import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:gap/gap.dart';
import 'package:desktop_drop/desktop_drop.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// A widget allowing dropping files
class TLDropZone extends StatefulWidget {

  /// The height of the drop zone
  final double height;

  /// The width of the drop zone
  final double width;

  /// The text of the text button
  final String clickableText;

  /// The text after the text button
  final String otherText;

  /// Wether the button is enabled
  final bool isEnabled;

  /// A callback for when the clickable text was pressed
  final void Function()? onPressed;

  /// A callback for when files have been dropped
  final void Function(List<File>)? onFilesDropped;

  /// Default constructor
  const TLDropZone({ 
    super.key,
    required this.clickableText,
    required this.otherText,
    this.height = 200.0,
    this.width = double.infinity,
    this.isEnabled = true,
    this.onPressed,
    this.onFilesDropped
  });

  @override
  State<TLDropZone> createState() => _TLDropZoneState();
}

class _TLDropZoneState extends State<TLDropZone> {

  bool _isHoveringOver = false;

  void _onDragDone(DropDoneDetails details) {
    final List<DropItem> dropItems = details.files;
    final List<File> files = dropItems.map((DropItem dropItem) => File(dropItem.path)).toList();
    widget.onFilesDropped?.call(files);
  }

  void _onDragEntered(DropEventDetails details) {
    setState(() => _isHoveringOver = true);
  }

  void _onDragExited(DropEventDetails details) {
    setState(() => _isHoveringOver = false);
  }

  @override
  Widget build(BuildContext context) {

    final TLColorable colors = TLTheme.colorsOf(context);

    final Widget innerChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0 - TLSpacing.xs)),
      child: Container(
        width: widget.width,
        height: widget.height,
        color: _isHoveringOver ? colors.dropZoneHoveringBackground : colors.dropZoneBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TLTextButton(
              onPressed: widget.onPressed,
              text: widget.clickableText,
              isEnabled: widget.isEnabled,
              color: colors.dropZoneClickableTextForeground
            ),
            const Gap(TLSpacing.xs),
            TLText(
              text: widget.otherText,
              alignment: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: colors.dropZoneOtherTextForeground
              )
            )
          ]
        )
      )
    );

    final Widget child = kIsWeb || Platform.isMacOS || Platform.isWindows
      ? DropTarget(
        onDragDone: _onDragDone,
        onDragEntered: _onDragEntered,
        onDragExited: _onDragExited,
        enable: widget.isEnabled,
        child: innerChild
      )
      : innerChild;

    return DottedBorder(
      color: colors.dropZoneBorder,
      strokeWidth: 1.5,
      radius: Radius.circular(12.0),
      borderType: BorderType.RRect,
      padding: EdgeInsets.all(TLSpacing.xs),
      child: child
    );
  }
}