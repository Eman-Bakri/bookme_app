import 'package:bookme_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

///------ Entry point of Book me app -----
Future<void> main() async {

// Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put/*AuthenticationRepository()*/);
  runApp(const MyApp());
}