import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/news/views/news_row.dart';

class AllNewsPage extends GetView {
  final List<News> news;

  const AllNewsPage({super.key, required this.news});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: ListView(
          children: [
            SizedBox(height: Get.height * 0.01,),

            for(News ne in news)
              NewsRow(news: ne,)
          ],
        ),
      )
    );
  }


}
