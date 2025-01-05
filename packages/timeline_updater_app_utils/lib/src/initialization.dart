import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A class that provides access to environment variables
class TLEnv {

  /// Default constructor
  const TLEnv();

  /// A getter for the Supabase URL
  String get supabaseUrl => getKey('SUPABASE_URL');

  /// A getter for the Supabase anonymous key
  String get supabaseAnonKey => getKey('SUPABASE_ANON_KEY');

  /// Helper method to get the value of an environment variable
  String getKey(String key) {
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
}

/// Loads the environment variables
Future<void> _loadEnv() async {
  await dotenv.load(fileName: 'dotenv');
}

/// Initializes the Supabase client
Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: TLEnv().supabaseUrl,
    anonKey: TLEnv().supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(detectSessionInUri: false)
  );
}

/// Initializes the Firebase client
Future<void> _initializeFirebase(FirebaseOptions options) async {
  // Skip when platform is Linux since Firebase does not support this platform, yet
  if (!kIsWeb && Platform.isLinux) return;
  await Firebase.initializeApp(options: options);
}