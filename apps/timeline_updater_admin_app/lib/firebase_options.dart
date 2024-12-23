// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBEqfnYd_Hp-TUVuE-O6HBqBVq0tAhcfE0',
    appId: '1:180660252180:web:66de09ccbaac6bf384c101',
    messagingSenderId: '180660252180',
    projectId: 'timeline-updater-admin-app',
    authDomain: 'timeline-updater-admin-app.firebaseapp.com',
    storageBucket: 'timeline-updater-admin-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq214hi1pMtZ2o_TjeDGZjCxUpLXZV1sE',
    appId: '1:180660252180:android:5bd034b5b3a607d984c101',
    messagingSenderId: '180660252180',
    projectId: 'timeline-updater-admin-app',
    storageBucket: 'timeline-updater-admin-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5PyrpP5PZGAxK9qvLF1UEIxHTALFLIhI',
    appId: '1:180660252180:ios:e265838990d9a84484c101',
    messagingSenderId: '180660252180',
    projectId: 'timeline-updater-admin-app',
    storageBucket: 'timeline-updater-admin-app.firebasestorage.app',
    iosBundleId: 'dev.coderave.timeline-updater-admin-app.ios',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5PyrpP5PZGAxK9qvLF1UEIxHTALFLIhI',
    appId: '1:180660252180:ios:d260c6fe8ab9a12484c101',
    messagingSenderId: '180660252180',
    projectId: 'timeline-updater-admin-app',
    storageBucket: 'timeline-updater-admin-app.firebasestorage.app',
    iosBundleId: 'dev.coderave.timeline-updater-admin-app.macos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBEqfnYd_Hp-TUVuE-O6HBqBVq0tAhcfE0',
    appId: '1:180660252180:web:37826149579158a584c101',
    messagingSenderId: '180660252180',
    projectId: 'timeline-updater-admin-app',
    authDomain: 'timeline-updater-admin-app.firebaseapp.com',
    storageBucket: 'timeline-updater-admin-app.firebasestorage.app',
  );
}
