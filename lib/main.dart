// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'dart:html';
import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
