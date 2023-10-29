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
    apiKey: 'AIzaSyB4lvAcqTshTKEBdXbyt9woRlTWRGPMQ6Q',
    appId: '1:368915940267:web:15d7c3f1f4ae8c82c7c8ee',
    messagingSenderId: '368915940267',
    projectId: 'projectone-1d20e',
    authDomain: 'projectone-1d20e.firebaseapp.com',
    storageBucket: 'projectone-1d20e.appspot.com',
    measurementId: 'G-SFRJNTWG88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZBlTP8mo8k0f4_1GTrYB_DXMDbuEKHkM',
    appId: '1:368915940267:android:c8d9ec836dd33d92c7c8ee',
    messagingSenderId: '368915940267',
    projectId: 'projectone-1d20e',
    storageBucket: 'projectone-1d20e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3_2rKnx3cZZeE6RDu0vwcdD31rul4ncU',
    appId: '1:368915940267:ios:92c97f4b359ab660c7c8ee',
    messagingSenderId: '368915940267',
    projectId: 'projectone-1d20e',
    storageBucket: 'projectone-1d20e.appspot.com',
    iosBundleId: 'com.example.projectOne',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3_2rKnx3cZZeE6RDu0vwcdD31rul4ncU',
    appId: '1:368915940267:ios:92c97f4b359ab660c7c8ee',
    messagingSenderId: '368915940267',
    projectId: 'projectone-1d20e',
    storageBucket: 'projectone-1d20e.appspot.com',
    iosBundleId: 'com.example.projectOne',
  );
}