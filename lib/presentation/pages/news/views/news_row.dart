import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/presentation/pages/news/news_details_page.dart';
import 'package:jiffy/jiffy.dart';

class NewsRow extends StatelessWidget {
  final News news;

  const NewsRow({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => NewsDetailsPage(news: news)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: CachedNetworkImage(
                width: Get.width * 0.25,
                height: Get.width * 0.25,
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
                imageUrl: news.image ?? "",
              ),
            ),
            SizedBox(width: Get.width * 0.02,),
            SizedBox(
              width: Get.width * 0.63,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(news.newsTag?.name ?? "", style: AppTextStyles.body,),
                  Text(news.title ?? "", style: AppTextStyles.title,),
                  Row(
                    children: [
                      Text(news.author ?? "UniServe Community", style: AppTextStyles.body,),
                      const SizedBox(width: 10,),
                      Icon(Octicons.primitive_dot, color: AppColors.black, size: 10,),
                      const SizedBox(width: 10,),
                      Text(Jiffy(news.publishedAt).yMMMMd, style: AppTextStyles.date,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
