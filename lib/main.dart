import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moboshop/screen/home_page/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
