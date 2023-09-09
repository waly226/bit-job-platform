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
    apiKey: 'AIzaSyB4CXE3MTqL4X-HZFXKxXhdA8Z86Xp6j6A',
    appId: '1:950558246905:web:582cd0610bfe2f359cdf28',
    messagingSenderId: '950558246905',
    projectId: 'unbun-project',
    authDomain: 'unbun-project.firebaseapp.com',
    storageBucket: 'unbun-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKQ7GTx1q6EBnM2nHt8rf3em0PJQFtWyc',
    appId: '1:950558246905:android:faff6dc14a3130689cdf28',
    messagingSenderId: '950558246905',
    projectId: 'unbun-project',
    storageBucket: 'unbun-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDllko5zd234cCDPhWtk9UJIN1isLrKWN0',
    appId: '1:950558246905:ios:1b3b8f16a7079d419cdf28',
    messagingSenderId: '950558246905',
    projectId: 'unbun-project',
    storageBucket: 'unbun-project.appspot.com',
    iosClientId: '950558246905-9iha7uetjb6gca8db9o215ncjpafcegj.apps.googleusercontent.com',
    iosBundleId: 'com.example.bitJobPlat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDllko5zd234cCDPhWtk9UJIN1isLrKWN0',
    appId: '1:950558246905:ios:1b3b8f16a7079d419cdf28',
    messagingSenderId: '950558246905',
    projectId: 'unbun-project',
    storageBucket: 'unbun-project.appspot.com',
    iosClientId: '950558246905-9iha7uetjb6gca8db9o215ncjpafcegj.apps.googleusercontent.com',
    iosBundleId: 'com.example.bitJobPlat',
  );
}