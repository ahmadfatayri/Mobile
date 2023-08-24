import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/user.dart';

class ProfileRow extends StatelessWidget {

  final User? user;

  const ProfileRow({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10,),

        InkWell(
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(Entypo.left_open_big, color: AppColors.quaternary),
          ),
        ),
        SizedBox(width: Get.width * 0.02,),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: !user.isNull ? CachedNetworkImage(
            width: Get.width * 0.12,
            height: Get.width * 0.12,
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
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey,
            ),
            imageUrl: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
          ) : Icon(Entypo.user, size: 40, color: AppColors.primaryColor,),
        ),
        SizedBox(width: Get.width * 0.05,),
        SizedBox(
          width: Get.width * 0.63,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(!user.isNull ? user?.name ?? "" : "", style: AppTextStyles.title_menu,),
              Text(!user.isNull ? "@${user?.email ?? ""}" : "Unlock the full UniServe experience: Create an account or Login Now!", style: AppTextStyles.body_menu,),
            ],
          ),
        )
      ],
    );
  }
}
