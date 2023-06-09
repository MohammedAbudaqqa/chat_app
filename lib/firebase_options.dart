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
    apiKey: 'AIzaSyBeXPcaRMF2tnShXp4-LwXht7GGvxOPB4U',
    appId: '1:318978474179:web:6a9e311c1684cd14a06276',
    messagingSenderId: '318978474179',
    projectId: 'chat-app-838dc',
    authDomain: 'chat-app-838dc.firebaseapp.com',
    storageBucket: 'chat-app-838dc.appspot.com',
    measurementId: 'G-1Z4LV445YK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx07ILkFvFCSVraDDqLhuTQRQS6xuxH3k',
    appId: '1:318978474179:android:730a64485a20d5cba06276',
    messagingSenderId: '318978474179',
    projectId: 'chat-app-838dc',
    storageBucket: 'chat-app-838dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFLQ4obpz89DxGLUREyo0vyf2lAiCPvc8',
    appId: '1:318978474179:ios:723bae4b67fb6d8fa06276',
    messagingSenderId: '318978474179',
    projectId: 'chat-app-838dc',
    storageBucket: 'chat-app-838dc.appspot.com',
    iosClientId: '318978474179-ke8im07nor3kof0qaf7ec9uah2p35c2l.apps.googleusercontent.com',
    iosBundleId: 'com.mohammedabudaqqa.chatapp.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFLQ4obpz89DxGLUREyo0vyf2lAiCPvc8',
    appId: '1:318978474179:ios:723bae4b67fb6d8fa06276',
    messagingSenderId: '318978474179',
    projectId: 'chat-app-838dc',
    storageBucket: 'chat-app-838dc.appspot.com',
    iosClientId: '318978474179-ke8im07nor3kof0qaf7ec9uah2p35c2l.apps.googleusercontent.com',
    iosBundleId: 'com.mohammedabudaqqa.chatapp.chatapp',
  );
}
