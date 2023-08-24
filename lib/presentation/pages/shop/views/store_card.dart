import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/app/library/rate/rate.dart';
import 'package:iqlim/domain/entities/store.dart';

import '../store_page.dart';


class StoreCell extends StatelessWidget {
  final Store store;
  final double? height;
  final double? width;
  final bool? withRate;

  const StoreCell({super.key, required this.store, this.height, this.width, this.withRate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => StorePage(store: store)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: (height != null ? 10 : 0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        height: height ?? 140,
        width: width ?? Get.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                width: width != null ? Get.width : Get.width * 0.7,
                height: height != null ? Get.height * 0.23 : Get.height * 0.2,
                memCacheHeight: 150,
                memCacheWidth: 150,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: width == null ? BoxFit.fitHeight : BoxFit.fitWidth,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey,
                ),
                imageUrl: store.header,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.title,
                      maxLines: 2,
                      style: AppTextStyles.title_store,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      store.description.length > 20 ?
                      "${store.description.substring(0, 20)}..." :
                      store.description ,
                      maxLines: 2,
                      style: AppTextStyles.desc_store,
                      textAlign: TextAlign.left,
                    ),
                    Visibility(
                      visible: withRate ?? false,
                      child: Rate(
                        iconSize: 16,
                        color: AppColors.tertiary,
                        allowHalf: true,
                        allowClear: true,
                        initialValue: store.rating,
                        readOnly: true,
                        onChange: (value) => {},
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                    offset: const Offset(0, -40),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primaryColor,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          width: Get.width * 0.18,
                          height: Get.width * 0.18,
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
                          imageUrl: store.profile,
                        ),
                      ),
                    )
                )


              ],
            )

          ],
        ),
      )
    );
  }
}
