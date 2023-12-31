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
    apiKey: 'AIzaSyB4fcOjj8g7Z2eslifvU17rJfT5oQuPJ18',
    appId: '1:352405295079:web:986d89f75692124852b742',
    messagingSenderId: '352405295079',
    projectId: 'vizyonergenc-80bc2',
    authDomain: 'vizyonergenc-80bc2.firebaseapp.com',
    storageBucket: 'vizyonergenc-80bc2.appspot.com',
    measurementId: 'G-3HHWTZK93R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWrR66Ic0b7uj7FBFxHHF68LTm1Twx4LE',
    appId: '1:352405295079:android:e775fa34503b9b8852b742',
    messagingSenderId: '352405295079',
    projectId: 'vizyonergenc-80bc2',
    storageBucket: 'vizyonergenc-80bc2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7yT_Ykqrx7YMJyfZIiPqTzuZBeOIwwHY',
    appId: '1:352405295079:ios:346e128c23d0888252b742',
    messagingSenderId: '352405295079',
    projectId: 'vizyonergenc-80bc2',
    storageBucket: 'vizyonergenc-80bc2.appspot.com',
    iosClientId: '352405295079-u7cvh2gfmockahi4m4bip1e3km8rmnin.apps.googleusercontent.com',
    iosBundleId: 'com.example.proje',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7yT_Ykqrx7YMJyfZIiPqTzuZBeOIwwHY',
    appId: '1:352405295079:ios:346e128c23d0888252b742',
    messagingSenderId: '352405295079',
    projectId: 'vizyonergenc-80bc2',
    storageBucket: 'vizyonergenc-80bc2.appspot.com',
    iosClientId: '352405295079-u7cvh2gfmockahi4m4bip1e3km8rmnin.apps.googleusercontent.com',
    iosBundleId: 'com.example.proje',
  );
}
