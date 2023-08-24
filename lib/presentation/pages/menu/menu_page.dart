import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/legal.dart';
import 'package:iqlim/domain/entities/user.dart';
import 'package:iqlim/presentation/controllers/auth/auth_controller.dart';
import 'package:iqlim/presentation/controllers/contact/contact_binding.dart';
import 'package:iqlim/presentation/controllers/home/home_controller.dart';
import 'package:iqlim/presentation/pages/contact/contact_page.dart';
import 'package:iqlim/presentation/pages/legal/legal_page.dart';
import 'package:iqlim/presentation/pages/menu/views/menu_row_square.dart';
import 'package:iqlim/presentation/pages/profile/signin_page.dart';
import 'package:iqlim/presentation/pages/profile/signup_page.dart';
import 'views/menu_row.dart';
import 'views/profile_row.dart';

class MenuPage extends GetView {

  MenuPage({super.key});

  final AuthController _controller = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [

                  ProfileRow(user: _controller.user.value,),

                  SizedBox(height: Get.height * 0.05,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.quaternary
                        ),
                        width: 2,
                        height: (_controller.user.value?.token != null) ? 210 : 85,
                        margin: const EdgeInsets.only(left: 20),
                      ),
                      Visibility(
                        visible: (_controller.user.value?.token != null),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MenuRow(icon: FontAwesome.user, name: "Profile", onTap: () => {},),
                            MenuRow(icon: FontAwesome.map_pin, name: "Address", onTap: () => {},),
                            MenuRow(icon: Octicons.saved, name: "Saved", onTap: () => {},),
                            MenuRow(icon: FontAwesome.history, name: "History", onTap: () => {},),
                            MenuRow(icon: FontAwesome.logout, name: "Log out", onTap: () => _controller.logout(),),
                          ],
                        )),
                      Visibility(
                          visible: (_controller.user.value?.token == null),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MenuRow(icon: Entypo.user_add, name: "Sign up", onTap: () => Get.to(() => SignupPage()) ,),
                              MenuRow(icon: FontAwesome.login, name: "Sign in", onTap: () => Get.to(() => SignInPage()),),
                            ],
                        )),
                    ],
                  ),

                  SizedBox(height: Get.height * 0.02,),
                  const Divider(thickness: 10,),
                  SizedBox(height: Get.height * 0.02,),

                  MenuRowSquare(color: AppColors.primaryColor, name: "About", onTap: () => Get.to(() => LegalPage(title: "About us", content: Legal.about)),),
                  MenuRowSquare(color: AppColors.searchBackgroundColor, name: "Contact us", onTap: () async {
                    ContactBinding().dependencies();
                    await Future.delayed(const Duration(seconds: 1));
                    Get.to(() => ContactPage());
                  }),
                  MenuRowSquare(color: AppColors.tertiary, name: "Chat", onTap: () => _homeController.openSupport(),),
                  MenuRowSquare(color: AppColors.quinary, name: "Privacy", onTap: () => Get.to(() => LegalPage(title: "Privacy policy", content: Legal.privacy)),),
                  MenuRowSquare(color: AppColors.blue, name: "Terms", onTap: () => Get.to(() => LegalPage(title: "Terms and condition", content: Legal.terms)),),
                  MenuRowSquare(color: AppColors.quaternary, name: "Refund", onTap: () => Get.to(() => LegalPage(title: "Refund policy", content: Legal.refund)),),
                  MenuRowSquare(color: AppColors.darkGrey, name: "FAQs", onTap: () => Get.to(() => LegalPage(title: "FAQs", content: Legal.faqs)),),
                ],
              ),
            ],
          ),
        )
    );
  }
}


