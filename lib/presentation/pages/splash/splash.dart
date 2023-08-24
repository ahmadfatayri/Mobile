import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/presentation/pages/splash/views/animated_logo.dart';

class SplashScreen extends GetView {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AnimatedLogo()
    );
  }
}
