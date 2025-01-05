import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:timeline_updater_app_ui/extensions/object_x.dart';
import 'package:timeline_updater_app_ui/error/launch_error.dart';

/// A class for accessing some core utilities
class TLCoreUtils {

  /// Launches an URL in the default browser
  static Future<void> openURL(BuildContext context, { required String uri }) async {
    final Uri url = Uri.parse(uri);
    final bool success = await launchUrl(url);
    // In case of failure show a toast to the user
    if (!success && context.mounted) LaunchError.urlNotOpened().showErrorToast(context);
  }
}