import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/type.dart';

class TypeCell extends StatelessWidget {
  final StoreType type;
  final VoidCallback onTap;
  final String selected;

  const TypeCell({super.key, required this.type, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          border: Border.all(color: (selected == type.name) ? AppColors.quaternary : AppColors.white)
        ),

        margin: const EdgeInsets.only(left: 10),
        height: Get.width * 0.21,
        width: Get.width * 0.21,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              width: Get.width * 0.14,
              height: Get.width * 0.14,
              memCacheHeight: 150,
              memCacheWidth: 150,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey,
              ),
              imageUrl: type.image ?? "",
            ),
            Text(
              type.name,
              maxLines: 2,
              style: AppTextStyles.title_cat,
            ),
          ],
        ),
      ),
    );
  }
}
