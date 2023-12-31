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
    apiKey: 'AIzaSyDmjxYih3QcBVj47KNOvxFdNI53ghrJUOw',
    appId: '1:130371762082:web:c770204a9d845f7c3ce4fb',
    messagingSenderId: '130371762082',
    projectId: 'swiftcart-f1d2a',
    authDomain: 'swiftcart-f1d2a.firebaseapp.com',
    storageBucket: 'swiftcart-f1d2a.appspot.com',
    measurementId: 'G-MMWWCDT4LW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBVjTX3kjHebGJzBtOhdIUUw75LZz88Bo',
    appId: '1:130371762082:android:1f78e61e036888ff3ce4fb',
    messagingSenderId: '130371762082',
    projectId: 'swiftcart-f1d2a',
    storageBucket: 'swiftcart-f1d2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjwN1ey5mC58w932wyjx458EN4UHypFsY',
    appId: '1:130371762082:ios:476c2a0137deb5593ce4fb',
    messagingSenderId: '130371762082',
    projectId: 'swiftcart-f1d2a',
    storageBucket: 'swiftcart-f1d2a.appspot.com',
    iosBundleId: 'com.example.firstAppDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjwN1ey5mC58w932wyjx458EN4UHypFsY',
    appId: '1:130371762082:ios:b00bb38d15bee7ba3ce4fb',
    messagingSenderId: '130371762082',
    projectId: 'swiftcart-f1d2a',
    storageBucket: 'swiftcart-f1d2a.appspot.com',
    iosBundleId: 'com.example.firstAppDemo.RunnerTests',
  );
}
