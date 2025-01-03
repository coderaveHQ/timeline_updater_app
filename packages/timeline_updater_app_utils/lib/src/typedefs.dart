import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:timeline_updater_app_utils/src/result.dart';

/// Json
typedef Json = Map<String, dynamic>;

/// `Result` but in a `Future`
typedef FutureResult<T, E extends Object> = Future<Result<T, E>>;

/// AuthState from Supabase
typedef SupabaseAuthState = supabase.AuthState;
/// AuthSession from Supabase
typedef SupabaseAuthSession = supabase.Session;