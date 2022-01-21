import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/controllerBindings.dart';

import 'onbording/welcome12.dart';

void main() async {
  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // bind our app with the  Getx Controller
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.purple[900],
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.amaranthTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: const Color(0xFFEBD8F0),
        duration: 700,

        nextScreen: welcome12(),

        // Welcome1()
        splash: Image.asset("assets/Picture1.png"),
      ),
    );
  }
}
