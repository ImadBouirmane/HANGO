import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LfvZ1UoAAAAACrFlMBKwLBBZLEbAAuGxRzz1kLw',
      androidProvider: AndroidProvider.playIntegrity,
    );
