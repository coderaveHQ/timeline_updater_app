import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeline_updater_admin_app/core/services/custom_preferences.dart';

import 'package:timeline_updater_admin_app/core/utils/env.dart';
import 'package:timeline_updater_admin_app/firebase_options.dart';
import 'package:timeline_updater_admin_app/src/app.dart';

/// The main entry point for the application
Future<void> main() async {
  // Ensure that the widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load the environment variables
  await _loadEnv();

  // Initialize the Supabase client
  await _initializeSupabase();

  // Initialize the Firebase client
  await _initializeFirebase();

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final CustomPreferences customPreferences = CustomPreferences(sharedPreferences);

  // Run the application
  runApp(
    ProviderScope(
      overrides: <Override>[
        customPreferencesProvider.overrideWithValue(customPreferences)
      ],
      child: const App()
    )
  );
}

/// Loads the environment variables
Future<void> _loadEnv() async {
  await dotenv.load(fileName: 'dotenv');
}

/// Initializes the Supabase client
Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(detectSessionInUri: false)
  );
}

/// Initializes the Firebase client
Future<void> _initializeFirebase() async {
  // Skip when platform is Linux since Firebase does not support this platform, yet
  if (!kIsWeb && Platform.isLinux) return;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}