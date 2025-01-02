import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_admin_app/firebase_options.dart';
import 'package:timeline_updater_admin_app/src/app.dart';

/// The main entry point for the application
Future<void> main() async {
  // Initialize the app and run it
  await initializeAndRun(
    app: const ProviderScope(child: App()),
    firebaseOptions: DefaultFirebaseOptions.currentPlatform
  );
}