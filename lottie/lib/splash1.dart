import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:lottie/lottie.dart';
import 'package:lottiesss/splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(animationDuration: Duration(seconds: 3),
      splash:Column(
      children: [
        Center(child: LottieBuilder.asset("/lottie/lottiee.json"),)
      ],
    ) ,
     nextScreen: Splash2());
  }
}