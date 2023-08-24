import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/library/floating_navigation_bar/floating_navbar.dart';
import 'package:iqlim/app/library/floating_navigation_bar/floating_navbar_item.dart';
import 'package:iqlim/app/types/tab_type.dart';
import 'package:iqlim/presentation/controllers/home/home_controller.dart';
import 'package:iqlim/presentation/controllers/shop/shop_binding.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({super.key});

  // final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
            () => FloatingNavbar(
            currentIndex: controller.selectedIndex.value,
            items: TabType.values.map((e) => FloatingNavbarItem(icon: e.icon.icon, title: e.title)).toList(),
            onTap: (int index) => controller.onItemChanged(index),
            backgroundColor: AppColors.quaternary,
            selectedBackgroundColor: AppColors.white,
            selectedItemColor: AppColors.quaternary,
            unselectedItemColor: AppColors.white,
            borderRadius: 30,
            itemBorderRadius: 20,
            width: Get.width * 0.7
        ),
      ),
      body: Obx(
            () => TabType.values[controller.selectedIndex.value].widget,
      ),
    );
    // return GetX(
    //   init: controller,
    //   initState: (state) {
    //     ShopBinding().dependencies();
    //   },
    //   builder: (_) {
    //
    //   },
    // );
  }
}
