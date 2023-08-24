import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/domain/entities/tag.dart';
import 'package:iqlim/presentation/controllers/news/news_controller.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:iqlim/presentation/pages/news/all_news_page.dart';
import 'package:iqlim/presentation/pages/news/views/news_row.dart';
import 'package:iqlim/presentation/pages/news/views/tag.dart';
import 'views/carousel_slider.dart';
import 'views/search_field.dart';

class NewsPage extends GetView<NewsController> {
  NewsPage({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchTagData();
        controller.fetchPinned();
        controller.fetchData();
        _scrollController.addListener(_scrollListener);
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: ListView(
                controller: _scrollController,
                children: [
                  SizedBox(height: Get.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Pinned News", style: AppTextStyles.bigTitle,),
                          const SizedBox(width: 5,),
                          Icon(Octicons.pin, color: AppColors.quinary,),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(AllNewsPage(news: controller.pinnedNews)),
                        child: Text("View all", style: AppTextStyles.view_all,),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01,),

                  CarouselNews(news: controller.pinnedNews,),

                  SizedBox(height: Get.height * 0.03,),

                  SearchField(onChanged: (String val) => controller.handleTextChanged(val),),

                  SizedBox(height: Get.height * 0.02,),

                  SizedBox(
                    height: Get.height * 0.05,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(Tag tag in controller.tags.value ?? [])
                          TagView(tag: tag.name ?? "", selected: controller.selectedTag.value.name ?? "All", onTap: () => controller.changeTag(tag),)
                      ],
                    ),
                  ),

                  SizedBox(height: Get.height * 0.04,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended News", style: AppTextStyles.bigTitle,),
                      GestureDetector(
                        onTap: () => Get.to(AllNewsPage(news: controller.news)),
                        child: Text("View all", style: AppTextStyles.view_all,),
                      )
                    ],
                  ),

                  SizedBox(height: Get.height * 0.01,),

                  for(News news in controller.news)
                    NewsRow(news: news,)
                ],
              ),
            )
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 150) {
      controller.loadMore();
    }
  }

}
