import 'package:flutter/material.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType type;

  const Field({super.key, required this.controller, required this.label, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: type == TextInputType.multiline ? 150 : 60,
      child: TextField(
        keyboardType: type,
        obscureText: label == "Password",
        maxLines: label == "Password" ? 1 : null,
        decoration: InputDecoration(
          // labelText: label,
          // labelStyle: AppTextStyles.field,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.lightGray,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: label,
          hintStyle: AppTextStyles.hint,
        ),
      )
      // CupertinoTextField(
      //   keyboardType: type,
      //   maxLines: null,
      //   placeholder: label,
      //   textAlign: TextAlign.left,
      //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      //   controller: controller,
      // ),
    );
  }
}
