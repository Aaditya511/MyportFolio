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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAT_qSD-n6gTVcujzQx3e0YUjpoNAiyOI0',
    appId: '1:438608318190:web:b5b931036ecde8efab6dff',
    messagingSenderId: '438608318190',
    projectId: 'my-portfolio-flutter-41434',
    authDomain: 'my-portfolio-flutter-41434.firebaseapp.com',
    storageBucket: 'my-portfolio-flutter-41434.appspot.com',
    measurementId: 'G-PEJ3Y5VNR6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5m9C7kp7Z0Wuq3OxwJrd13HOXAcl6eXo',
    appId: '1:438608318190:android:1f53acdee29bb524ab6dff',
    messagingSenderId: '438608318190',
    projectId: 'my-portfolio-flutter-41434',
    storageBucket: 'my-portfolio-flutter-41434.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANEn7m0vB8k_ZLUj46S6UmlxZ_AL2Onl4',
    appId: '1:438608318190:ios:4804f57213d049d5ab6dff',
    messagingSenderId: '438608318190',
    projectId: 'my-portfolio-flutter-41434',
    storageBucket: 'my-portfolio-flutter-41434.appspot.com',
    iosBundleId: 'com.example.myPortfolio',
  );
}
