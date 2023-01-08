import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:course_app/view_model/controle_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: ListView(
          children: [
            Image.asset("assets/images/Splash.png"),
          ],
        ),
      ),
      nextScreen: ControleView(),
      backgroundColor: Colors.white,
      splashIconSize: 360,
      duration: 1500,
    );
  }
}
