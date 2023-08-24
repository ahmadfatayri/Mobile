import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/presentation/controllers/shop/shop_controller.dart';
import 'package:iqlim/presentation/pages/menu/menu_page.dart';
import 'package:iqlim/presentation/pages/shop/views/category_card.dart';
import 'package:iqlim/presentation/pages/shop/views/store_card.dart';

class ShopPage extends GetView<ShopController> {

  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
        controller.fetchStores(Category(name: '', image: '', id: '', createdAt: '', popularity: 10, description: ''));
      },
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Hi, there\nEnabling Your Journey to the Moon and Back", style: AppTextStyles.body,),
                SizedBox(height: Get.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discover", style: AppTextStyles.bigTitle,),
                    IconButton(
                        onPressed: () => {
                          Get.to( () =>
                            MenuPage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500),
                          )
                        },
                        icon: Icon(Entypo.menu, color: AppColors.quaternary, size: 30,)
                    )
                  ],
                ),
                
                SizedBox(height: Get.height * 0.03,),
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    for(Category cat in controller.categories)
                      CategoryCell(category: cat, onTap: () => controller.openCategory(cat),),
                  ],
                ),
                SizedBox(height: Get.height * 0.03,),

                Text("Top Stores:", style: AppTextStyles.bigTitle,),

                SizedBox(height: Get.height * 0.02,),

                SizedBox(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(Store store in controller.stores)
                        StoreCell(store: store)
                    ],
                  ),
                ),

                SizedBox(height: Get.height * 0.03,),

                Text("Top Offers:", style: AppTextStyles.bigTitle,),

                SizedBox(height: Get.height * 0.02,),

              ],
            ),
          )
        );
      },
    );
  }

}
