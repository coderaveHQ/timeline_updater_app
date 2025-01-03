import 'package:flutter/material.dart';

import 'package:timeline_updater_app_ui/timeline_updater_app_ui.dart';

/// The main page that contains of the navigation bar and the actual navigator
class MainPage extends StatelessWidget {

  /// The widget to be displayed based on the current route
  final Widget navigator;

  /// Default constructor
  const MainPage({ 
    super.key,
    required this.navigator
  });

  @override
  Widget build(BuildContext context) {
    return TLScaffold(body: navigator);
  }
}