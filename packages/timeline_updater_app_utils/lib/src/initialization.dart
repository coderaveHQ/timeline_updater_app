import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

/// A class that provides access to environment variables
abstract class TLEnv {

  /// A getter for the Supabase URL
  static String get supabaseUrl => getKey('SUPABASE_URL');

  /// A getter for the Supabase anonymous key
  static String get supabaseAnonKey => getKey('SUPABASE_ANON_KEY');

  /// Helper method to get the value of an environment variable
  static String getKey(String key) {
    return dotenv.env[key]!;
  }
}

/// Initializes and runs the App
Future<void> initializeAndRun({ 
  required Widget app,
  required FirebaseOptions firebaseOptions 
}) async {
  // Ensure that the widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load the environment variables
  await _loadEnv();

  // Initialize the Supabase client
  await _initializeSupabase();

  // Initialize the Firebase client
  await _initializeFirebase(firebaseOptions);

  // Run the application
  runApp(app);

  // Configure the window
  _configureDesktopWindow();
}

/// Loads the environment variables
Future<void> _loadEnv() async {
  await dotenv.load(fileName: 'dotenv');
}

/// Initializes the Supabase client
Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: TLEnv.supabaseUrl,
    anonKey: TLEnv.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(detectSessionInUri: false)
  );
}

/// Initializes the Firebase client
Future<void> _initializeFirebase(FirebaseOptions options) async {
  // Skip when platform is Linux since Firebase does not support this platform, yet
  if (!kIsWeb && Platform.isLinux) return;
  await Firebase.initializeApp(options: options);
}

/// Configures the desktop window
void _configureDesktopWindow() {
  // Skip when platform is Web or Mobile since there is no window to be configured
  if (kIsWeb || Platform.isAndroid || Platform.isIOS) return;
  doWhenWindowReady(() {
    const Size initialSize = Size(600.0, 450.0);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}