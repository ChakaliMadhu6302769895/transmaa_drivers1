// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAYU7gOyZMri4qfUQkqY-_iY6bTm3zXmeM',
    appId: '1:15572371265:web:92e89101f88b05f33e03c0',
    messagingSenderId: '15572371265',
    projectId: 'transmaa-d362b',
    authDomain: 'transmaa-d362b.firebaseapp.com',
    databaseURL: 'https://transmaa-d362b-default-rtdb.firebaseio.com',
    storageBucket: 'transmaa-d362b.appspot.com',
    measurementId: 'G-GV3QEV73CX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDM2ELlrPBVW8Zi2NVCR2BwYmjpO-Zc4lE',
    appId: '1:15572371265:android:746e0ed225c8a3e13e03c0',
    messagingSenderId: '15572371265',
    projectId: 'transmaa-d362b',
    databaseURL: 'https://transmaa-d362b-default-rtdb.firebaseio.com',
    storageBucket: 'transmaa-d362b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgx_4NWdG-PQHEjTpeK_426GrtoIRKk5o',
    appId: '1:15572371265:ios:d58d41499ec0a8293e03c0',
    messagingSenderId: '15572371265',
    projectId: 'transmaa-d362b',
    databaseURL: 'https://transmaa-d362b-default-rtdb.firebaseio.com',
    storageBucket: 'transmaa-d362b.appspot.com',
    iosBundleId: 'com.example.transmaaDrivers1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgx_4NWdG-PQHEjTpeK_426GrtoIRKk5o',
    appId: '1:15572371265:ios:8048adb2247fd75b3e03c0',
    messagingSenderId: '15572371265',
    projectId: 'transmaa-d362b',
    databaseURL: 'https://transmaa-d362b-default-rtdb.firebaseio.com',
    storageBucket: 'transmaa-d362b.appspot.com',
    iosBundleId: 'com.example.transmaaDrivers1.RunnerTests',
  );
}
