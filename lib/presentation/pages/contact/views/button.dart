import 'package:flutter/material.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;

  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.quaternary,
      elevation: 0,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        "Send",
        style: AppTextStyles.button,
      ),
    );
  }
}

