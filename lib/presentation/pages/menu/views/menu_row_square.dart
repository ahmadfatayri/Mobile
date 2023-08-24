import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class MenuRowSquare extends StatelessWidget {
  final Color color;
  final String name;
  final VoidCallback onTap;

  const MenuRowSquare({super.key, required this.color, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.90,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(FontAwesome5.square, size: 18, color: color,),
                const SizedBox(width: 20),
                Text(name, style: AppTextStyles.body_menu,),
                const SizedBox(width: 20),
              ],
            ),
            Icon(Entypo.right_open_big, size: 20, color: AppColors.lightGray,)
          ],
        ),
      ),
    );
  }
}
