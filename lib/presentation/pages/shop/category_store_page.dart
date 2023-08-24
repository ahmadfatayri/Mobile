import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/domain/entities/type.dart';
import 'package:iqlim/presentation/controllers/shop/shop_controller.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/shop/views/search_field.dart';
import 'package:iqlim/presentation/pages/shop/views/store_card.dart';
import 'package:iqlim/presentation/pages/shop/views/type_card.dart';

class CategoryStorePage extends GetView<ShopController> {
  final Category category;
  final String handle;
  const CategoryStorePage({super.key, required this.category, required this.handle});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchStoreTypes(handle);
        controller.fetchStores(category);
      },
      builder: (_) {
        return Scaffold(
          appBar: const Appbar(),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: ListView(
                children: [
                  SizedBox(height: Get.height * 0.03,),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(StoreType type in controller.types)
                          TypeCell(type: type, selected: controller.selectedStoreType.value.name ?? "", onTap: () => controller.changeType(type),)
                      ],
                    ),
                  ),

                  SizedBox(height: Get.height * 0.03,),

                  SearchField(onChanged: (String val) => controller.handleTextChanged(val),),

                  SizedBox(height: Get.height * 0.03,),

                  Text("Top Stores:", style: AppTextStyles.bigTitle,),

                  SizedBox(height: Get.height * 0.02,),

                  Column(
                    children: [
                      for(Store store in controller.stores)
                        StoreCell(store: store, height: 310, width: Get.width * 0.9, withRate: true,)
                    ],
                  ),

                ],
              ),
            )
        );
      },
    );
  }

}
