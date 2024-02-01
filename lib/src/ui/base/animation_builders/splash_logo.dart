import 'package:flutter/material.dart';
import 'package:gaw_ui/src/utility/constants.dart';
import 'package:lottie/lottie.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/videos/splash_video.json',
      package: kPackageName,
    );
  }
}
