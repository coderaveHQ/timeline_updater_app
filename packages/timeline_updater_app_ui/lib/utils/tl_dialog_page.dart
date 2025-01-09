import 'package:flutter/material.dart';

/// A class for using dialogs as pages
class TLDialogPage<T> extends Page<T> {

  /// The anchor point
  final Offset? anchorPoint;

  /// The barrier color
  final Color? barrierColor;

  /// Wether is barrier dismissible
  final bool barrierDismissible;

  /// The barrier label
  final String? barrierLabel;

  /// Wether to use SafeArea
  final bool useSafeArea;

  /// The themes
  final CapturedThemes? themes;

  /// The builder function for the dialog content
  final Widget Function(BuildContext) builder;

  /// Default constructor
  const TLDialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black87, // Use the material theme standard here
    this.barrierDismissible = false,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
    context: context,
    settings: this,
    builder: builder,
    anchorPoint: anchorPoint,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    themes: themes
  );
}