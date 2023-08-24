import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class TagView extends StatelessWidget {
  final String tag;
  final VoidCallback onTap;
  final String selected;

  const TagView({super.key, required this.tag, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: tag == selected ? AppColors.lightBlue : AppColors.searchBackgroundColor,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Text(tag, style: AppTextStyles.body,),
      ),
    );
  }
}
