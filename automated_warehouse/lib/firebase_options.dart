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
    apiKey: 'AIzaSyDawmoNqPV_2x03rZBijS3lPlLczNvjYkY',
    appId: '1:518798262441:web:0610252dc0937c714769b8',
    messagingSenderId: '518798262441',
    projectId: 'automated-warehouse',
    authDomain: 'automated-warehouse.firebaseapp.com',
    databaseURL: 'https://automated-warehouse-default-rtdb.firebaseio.com',
    storageBucket: 'automated-warehouse.appspot.com',
    measurementId: 'G-P0T8DP4M5P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEZjtDPj51HpXsCTNECrWVfUgDfidwO7o',
    appId: '1:518798262441:android:5ec9aa799503e2894769b8',
    messagingSenderId: '518798262441',
    projectId: 'automated-warehouse',
    databaseURL: 'https://automated-warehouse-default-rtdb.firebaseio.com',
    storageBucket: 'automated-warehouse.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr7XvoncuHJaMpPXDFmtjaHTX3MsAxO_w',
    appId: '1:518798262441:ios:a4d33fd002ad3fd14769b8',
    messagingSenderId: '518798262441',
    projectId: 'automated-warehouse',
    databaseURL: 'https://automated-warehouse-default-rtdb.firebaseio.com',
    storageBucket: 'automated-warehouse.appspot.com',
    iosClientId: '518798262441-pr87bpegadql5u86ehoe22f324ah4up4.apps.googleusercontent.com',
    iosBundleId: 'com.example.automatedWarehouse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCr7XvoncuHJaMpPXDFmtjaHTX3MsAxO_w',
    appId: '1:518798262441:ios:a4d33fd002ad3fd14769b8',
    messagingSenderId: '518798262441',
    projectId: 'automated-warehouse',
    databaseURL: 'https://automated-warehouse-default-rtdb.firebaseio.com',
    storageBucket: 'automated-warehouse.appspot.com',
    iosClientId: '518798262441-pr87bpegadql5u86ehoe22f324ah4up4.apps.googleusercontent.com',
    iosBundleId: 'com.example.automatedWarehouse',
  );
}
