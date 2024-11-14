// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRENZhhM4iLVElvbQ_YG-6k2AFcAQpxP8',
    appId: '1:26590467051:android:371591ca566bf6190c7fae',
    messagingSenderId: '26590467051',
    projectId: 'flutter-instagram-clone-1417b',
    storageBucket: 'flutter-instagram-clone-1417b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUNE6PJMqYMiYXYVQGIJ7tZ_YMOnccyOk',
    appId: '1:26590467051:ios:ddd945c2d84b65da0c7fae',
    messagingSenderId: '26590467051',
    projectId: 'flutter-instagram-clone-1417b',
    storageBucket: 'flutter-instagram-clone-1417b.firebasestorage.app',
    iosClientId: '26590467051-aujsv62jqh3kg9kdae2p7klgdf02fsds.apps.googleusercontent.com',
    iosBundleId: 'com.stevenitch.flutterInstagramClone.dev',
  );
}