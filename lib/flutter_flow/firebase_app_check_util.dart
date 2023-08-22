import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LcETXUkAAAAAHVGcDj_MJmB_CY935mg82wwZNd8',
      androidProvider: AndroidProvider.playIntegrity,
    );
