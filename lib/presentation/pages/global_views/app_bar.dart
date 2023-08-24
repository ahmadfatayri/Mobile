import 'package:flutter/material.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {

  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text('UniServe', style: AppTextStyles.appBar,),
      backgroundColor: AppColors.white,
      shadowColor: AppColors.darkWhite,
      elevation: 1,
      toolbarHeight: 30,
      iconTheme: IconThemeData(
        color: AppColors.quaternary
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}