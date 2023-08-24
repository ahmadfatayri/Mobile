import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/app/library/rate/rate.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/presentation/controllers/shop/shop_controller.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/shop/views/search_field.dart';

class StorePage extends GetView<ShopController> {
  final Store store;
  const StorePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        // controller.fetchStoreTypes(handle);
        // controller.fetchStores(category);
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.25,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          store.header,
                        ),
                        fit: BoxFit.fitWidth,
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Icon(Entypo.left_open_big, size: 20, color: AppColors.black,),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: AppColors.lightGray,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Icon(LineariconsFree.heart_1, size: 25, color: AppColors.black,),
                            )
                          ],
                        ),
                      ],
                    )
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        )
                    ),
                    transform: Matrix4.translationValues(0, -40, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          store.title,
                          style: AppTextStyles.title_store,
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(width: Get.width * 0.2,),
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
                    ),
                  ),


                ],
              ),

              Text(controller.selectedStoreType.value.name, style: AppTextStyles.hidden,),

              Container(
                transform: Matrix4.translationValues(0, -30, 0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Rate(
                              allowHalf: true,
                              readOnly: true,
                              iconSize: 20,
                              color: AppColors.quaternary,
                              initialValue: 4.5,
                            ),
                            const SizedBox(width: 10,),
                            Icon(Icons.circle, size: 10, color: AppColors.darkGrey,),
                            const SizedBox(width: 10,),
                            const Text("(1.5 k) Avg.")
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.access_time, size: 20, color: AppColors.darkGrey,),
                            const SizedBox(width: 10,),
                            const Text("25 - 30 Mins")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02,),


                    Text(
                      store.description ,
                      maxLines: 2,
                      style: AppTextStyles.desc_store,
                      textAlign: TextAlign.left,
                    ),

                    SizedBox(height: Get.height * 0.03,),

                    SearchField(onChanged: (String val) => controller.handleTextChanged(val),),

                    SizedBox(height: Get.height * 0.03,),

                    SizedBox(
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.quaternary
                              )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Burger', style: AppTextStyles.tag,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.quaternary
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Dessert', style: AppTextStyles.tag,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.quaternary
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Drinks', style: AppTextStyles.tag,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.quaternary
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Snacks', style: AppTextStyles.tag,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.quaternary
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Sandwich', style: AppTextStyles.tag,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.quaternary
                                )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Pizza', style: AppTextStyles.tag,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03,),

                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          // margin: EdgeInsets.s(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.lightGray
                              )
                            )
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Chicken Burger", style: AppTextStyles.title_store,),
                                    SizedBox(height: 5,),
                                    Text('2 Chicken Burger Jr. Sand, Regular Fries, And Regular Soft Drink', style: AppTextStyles.title_cat,),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text("\$ 20", style: AppTextStyles.compare_price,),
                                        SizedBox(width: 10,),
                                        Text("\$ 24", style: AppTextStyles.discounted_price, ),
                                      ],
                                    )

                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    width: Get.width * 0.20,
                                    height: Get.width * 0.20,
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
                                    imageUrl: "https://www.allrecipes.com/thmb/5JVfA7MxfTUPfRerQMdF-nGKsLY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25473-the-perfect-basic-burger-DDMFS-4x3-56eaba3833fd4a26a82755bcd0be0c54.jpg",
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),



              SizedBox(height: Get.height * 0.02,),

            ],
          ),
        );
      },
    );
  }

}
