import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:timeline_updater_customer_app/core/utils/env.dart';
import 'package:timeline_updater_customer_app/src/app.dart';

/// The main entry point for the application
Future<void> main() async {

  /// Ensure that the widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Load the environment variables
  await loadEnv();

  /// Initialize the Supabase client
  await initializeSupabase();

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