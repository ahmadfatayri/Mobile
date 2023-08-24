import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/presentation/pages/news/news_details_page.dart';

class CarouselNews extends StatelessWidget {
  final List<News> news;

  const CarouselNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: news
          .map((item) => Container(
        margin: const EdgeInsets.all(0.0),
        child: GestureDetector(
          onTap: () => Get.to(() => NewsDetailsPage(news: item)),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    width: Get.width * 0.8,
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
                    imageUrl: item.image ?? "",
                  ),
                  // Image.network(item.image ?? "", fit: BoxFit.cover, width: Get.width * 0.8),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        item.title ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        )
      ))
          .toList(),
    );
  }
}
