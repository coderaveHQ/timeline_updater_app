import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:timeline_updater_admin_app/core/utils/env.dart';
import 'package:timeline_updater_admin_app/firebase_options.dart';
import 'package:timeline_updater_admin_app/src/app.dart';

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

  /// Run the application
  runApp(const App());
}

/// Loads the environment variables
Future<void> loadEnv() async {
  await dotenv.load();
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