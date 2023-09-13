import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDmP6aJTRYjSd5-3zsciJw0I45FuYiRim4",
            authDomain: "hango-bfc6b.firebaseapp.com",
            projectId: "hango-bfc6b",
            storageBucket: "hango-bfc6b.appspot.com",
            messagingSenderId: "376408084302",
            appId: "1:376408084302:web:b59e2da05b5450d3bf581f",
            measurementId: "G-TB7ZQDL447"));
  } else {
    await Firebase.initializeApp();
  }
}
