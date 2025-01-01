import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:timeline_updater_customer_app/core/utils/env.dart';
import 'package:timeline_updater_customer_app/src/app.dart';
import 'package:timeline_updater_customer_app/firebase_options.dart';

/// The main entry point for the application
Future<void> main() async {

  // Ensure that the widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load the environment variables
  await loadEnv();

  // Initialize the Supabase client
  await initializeSupabase();

  // Initialize the Firebase client
  await initializeFirebase();

  // Run the application
  runApp(const App());

  // Configure the window
  configureDesktopWindow();
}

/// Loads the environment variables
Future<void> loadEnv() async {
  await dotenv.load(fileName: 'dotenv');
}

/// Initializes the Supabase client
Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(detectSessionInUri: false)
  );
}

/// Initializes the Firebase client
Future<void> initializeFirebase() async {
  // Skip when platform is Linux since Firebase does not support this platform, yet
  if (!kIsWeb && Platform.isLinux) return;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

/// Configures the desktop window
void configureDesktopWindow() {
  // Skip when platform is Web or Mobile since there is no window to be configured
  if (kIsWeb || Platform.isAndroid || Platform.isIOS) return;

  // Configure the window
  doWhenWindowReady(() {
    const Size initialSize = Size(600.0, 450.0);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}