import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD61EGrN51OAxGo01cTfkP6OVws0tSrWCU",
            authDomain: "quizzapp-cdf59.firebaseapp.com",
            projectId: "quizzapp-cdf59",
            storageBucket: "quizzapp-cdf59.firebasestorage.app",
            messagingSenderId: "851369316021",
            appId: "1:851369316021:web:384cc8d7d84333274d38fc",
            measurementId: "G-53MC5G5465"));
  } else {
    await Firebase.initializeApp();
  }
}
