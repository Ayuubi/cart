import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCVoimUNVrwtAeJv8_wgV_wEFa2zAo_Bas",
            authDomain: "nagad-f6ebd.firebaseapp.com",
            projectId: "nagad-f6ebd",
            storageBucket: "nagad-f6ebd.appspot.com",
            messagingSenderId: "975156116622",
            appId: "1:975156116622:web:571f993ac0dfe869f01ddf"));
  } else {
    await Firebase.initializeApp();
  }
}
