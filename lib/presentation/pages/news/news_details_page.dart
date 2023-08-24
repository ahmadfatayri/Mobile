import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:jiffy/jiffy.dart';

class NewsDetailsPage extends GetView {
  final News news;

  const NewsDetailsPage({super.key, required this.news});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: ListView(
          children: [
            CachedNetworkImage(
              width: Get.width * 0.9,
              height: Get.height * 0.25,
              memCacheHeight: 150,
              memCacheWidth: 150,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey,
              ),
              imageUrl: news.image ?? "",
            ),
            SizedBox(height: Get.height * 0.02,),
            Text(news.title ?? "", style: AppTextStyles.bigTitle,),
            SizedBox(height: Get.height * 0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(news.author ?? "UniServe Community", style: AppTextStyles.title,),
                Text(Jiffy(news.publishedAt).yMMMMd, style: AppTextStyles.title,),
              ],
            ),
            SizedBox(height: Get.height * 0.02,),
            Text(news.content ?? "", style: AppTextStyles.body,),
            SizedBox(height: Get.height * 0.02,),
            Text("#${news.newsTag?.name ?? ''}", style: AppTextStyles.tag,),
          ],
        ),
      )
    );
  }


}
