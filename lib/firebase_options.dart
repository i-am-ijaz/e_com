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
    apiKey: 'AIzaSyC5O_yc6fjzH4L7kYTJQXZeqhXWkBY6hj8',
    appId: '1:108003611412:web:716a6fecdfab8b4e7a2801',
    messagingSenderId: '108003611412',
    projectId: 'e-com-757c9',
    authDomain: 'e-com-757c9.firebaseapp.com',
    storageBucket: 'e-com-757c9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWv12fI5b3VzUrl92Lf1wztqe7m5mrjcI',
    appId: '1:108003611412:android:0d825df26aa3fb727a2801',
    messagingSenderId: '108003611412',
    projectId: 'e-com-757c9',
    storageBucket: 'e-com-757c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwQD5iytecFw6i3U_Y78hyBjcxuSBlwRM',
    appId: '1:108003611412:ios:a9d75c3e58cfb0c07a2801',
    messagingSenderId: '108003611412',
    projectId: 'e-com-757c9',
    storageBucket: 'e-com-757c9.appspot.com',
    iosBundleId: 'com.example.eCom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwQD5iytecFw6i3U_Y78hyBjcxuSBlwRM',
    appId: '1:108003611412:ios:7847ad962e7ac1a07a2801',
    messagingSenderId: '108003611412',
    projectId: 'e-com-757c9',
    storageBucket: 'e-com-757c9.appspot.com',
    iosBundleId: 'com.example.eCom.RunnerTests',
  );
}