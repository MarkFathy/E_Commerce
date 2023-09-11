import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/features/presentation/onbording/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      duration: 2000,
        splash: Image(
          height: 100.h,
            width: 100.w,
            image:const AssetImage('assets/images/splash1.png')),
        splashTransition: SplashTransition.rotationTransition,
        nextScreen:const OnBoarding());

  }
}

