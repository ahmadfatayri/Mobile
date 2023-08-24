import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class MenuRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onTap;

  const MenuRow({super.key, required this.icon, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 10, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.quaternary,
                  ),
                  width: 30,
                  height: 2,
                ),
                const SizedBox(width: 20),
                Text(name, style: AppTextStyles.body_menu,),
                const SizedBox(width: 20),
              ],
            ),
            Icon(icon, size: 20, color: AppColors.quaternary,)
          ],
        ),
      ),
    );
  }
}
