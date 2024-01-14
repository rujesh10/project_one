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
    apiKey: 'AIzaSyBXL1RW5ZwVztQHLfDouFcLwm6zTHkrDYc',
    appId: '1:972687008586:web:86c7f16a003241c3eb97b3',
    messagingSenderId: '972687008586',
    projectId: 'projectone-86cbb',
    authDomain: 'projectone-86cbb.firebaseapp.com',
    storageBucket: 'projectone-86cbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr-RbgOmNPnM7vMBZEcbtz5S4S6VebRGA',
    appId: '1:972687008586:android:c9dc5a3cecc0a75deb97b3',
    messagingSenderId: '972687008586',
    projectId: 'projectone-86cbb',
    storageBucket: 'projectone-86cbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDyHIUu7eEThLZcxyfKKODPwYdvCJOGKE',
    appId: '1:972687008586:ios:63ab4b29acb7e09aeb97b3',
    messagingSenderId: '972687008586',
    projectId: 'projectone-86cbb',
    storageBucket: 'projectone-86cbb.appspot.com',
    iosBundleId: 'com.example.projectOne',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDyHIUu7eEThLZcxyfKKODPwYdvCJOGKE',
    appId: '1:972687008586:ios:63ab4b29acb7e09aeb97b3',
    messagingSenderId: '972687008586',
    projectId: 'projectone-86cbb',
    storageBucket: 'projectone-86cbb.appspot.com',
    iosBundleId: 'com.example.projectOne',
  );
}
