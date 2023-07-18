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
    apiKey: 'AIzaSyBiXhgzef6dsS9wCkw9Syp3p-CydEtxeWY',
    appId: '1:888334638271:web:eae3aedfc76597a5493a0a',
    messagingSenderId: '888334638271',
    projectId: 'irriot-app',
    authDomain: 'irriot-app.firebaseapp.com',
    storageBucket: 'irriot-app.appspot.com',
    measurementId: 'G-ERC4ERJRCR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuZuKUKgXj34SbYeZG2utqKP5nc6qo4Cw',
    appId: '1:888334638271:android:4803d0d0376815dc493a0a',
    messagingSenderId: '888334638271',
    projectId: 'irriot-app',
    storageBucket: 'irriot-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiUIhjH-BjtgL11sMDDLJduNRBnw3hqzk',
    appId: '1:888334638271:ios:e6d2204a1f331056493a0a',
    messagingSenderId: '888334638271',
    projectId: 'irriot-app',
    storageBucket: 'irriot-app.appspot.com',
    iosClientId: '888334638271-mlu1b3h6fq9gv87u4a0npjbj0mt8i6mm.apps.googleusercontent.com',
    iosBundleId: 'com.example.irriot',
  );
}
