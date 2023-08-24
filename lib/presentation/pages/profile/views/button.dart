import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color? color;

  const Button({super.key, required this.onTap, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: color ?? AppColors.quaternary,
      elevation: 0,
      height: 45,
      minWidth: Get.width * 0.8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        label,
        style: AppTextStyles.button,
      ),
    );
  }
}

