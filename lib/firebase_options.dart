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
    apiKey: 'AIzaSyC8hU_40DoAS1Imyi3UW8y7yQ9K37iWCmU',
    appId: '1:898274107653:web:ee3bda21c78ac9b352176c',
    messagingSenderId: '898274107653',
    projectId: 'fast-inspection-au',
    authDomain: 'fast-inspection-au.firebaseapp.com',
    storageBucket: 'fast-inspection-au.appspot.com',
    measurementId: 'G-J852295X14',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOOEVXdvSyG2yupCRJcPR8Ijrffxc-Y08',
    appId: '1:898274107653:android:8f5c4f65cbe7611b52176c',
    messagingSenderId: '898274107653',
    projectId: 'fast-inspection-au',
    storageBucket: 'fast-inspection-au.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHVI8bRzOFE-45KosoKGKAdP-0WNxFWQk',
    appId: '1:898274107653:ios:3d37a94250ac1f9e52176c',
    messagingSenderId: '898274107653',
    projectId: 'fast-inspection-au',
    storageBucket: 'fast-inspection-au.appspot.com',
    iosClientId: '898274107653-0g9e4d5dkfseft2v5dod7j85eo5uus2o.apps.googleusercontent.com',
    iosBundleId: 'dev.sayeed.fastinspection',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHVI8bRzOFE-45KosoKGKAdP-0WNxFWQk',
    appId: '1:898274107653:ios:eb819c917fe68f9552176c',
    messagingSenderId: '898274107653',
    projectId: 'fast-inspection-au',
    storageBucket: 'fast-inspection-au.appspot.com',
    iosClientId: '898274107653-3r60h0nan3cq9ehkmi3st4stqd920kgi.apps.googleusercontent.com',
    iosBundleId: 'dev.sayeed.fastinspection.RunnerTests',
  );
}
