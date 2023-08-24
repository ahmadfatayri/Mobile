import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/util/util.dart';
import 'package:iqlim/presentation/pages/home/home_page.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  AnimatedLogoState createState() => AnimatedLogoState();
}

class AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)..addListener(() {
      setState(() {});
    });
    controller.forward().then((_) {
      Get.off(() => const HomePage());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.quaternary),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Opacity(
                opacity: opacity.value,
                child: Center(
                  child: Image.asset(Utils.getImagePath("logo"), width: Get.width * 0.8,),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Powered by '),
                    TextSpan(
                        text: 'AI',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
