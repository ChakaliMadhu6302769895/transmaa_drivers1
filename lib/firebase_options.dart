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
    apiKey: 'AIzaSyC0i7gbFkT5GVDEP2KhVel5pZz5xld__Nc',
    appId: '1:317818174779:web:c2dec2d680866df0660b1e',
    messagingSenderId: '317818174779',
    projectId: 'transmaa-9fa8e',
    authDomain: 'transmaa-9fa8e.firebaseapp.com',
    storageBucket: 'transmaa-9fa8e.appspot.com',
    measurementId: 'G-RP7L6PTMH4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjK6C4Celx1bB8Ty6vemK-7d7TUlnfgyo',
    appId: '1:317818174779:android:bed76db45b089187660b1e',
    messagingSenderId: '317818174779',
    projectId: 'transmaa-9fa8e',
    storageBucket: 'transmaa-9fa8e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAq9ymnnbb1ptMwL_MZpmhQkMzHwpASm1s',
    appId: '1:317818174779:ios:995ed5ffa95abb49660b1e',
    messagingSenderId: '317818174779',
    projectId: 'transmaa-9fa8e',
    storageBucket: 'transmaa-9fa8e.appspot.com',
    iosBundleId: 'com.example.transmaaDrivers1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAq9ymnnbb1ptMwL_MZpmhQkMzHwpASm1s',
    appId: '1:317818174779:ios:c22084fbe1d482b1660b1e',
    messagingSenderId: '317818174779',
    projectId: 'transmaa-9fa8e',
    storageBucket: 'transmaa-9fa8e.appspot.com',
    iosBundleId: 'com.example.transmaaDrivers1.RunnerTests',
  );
}
