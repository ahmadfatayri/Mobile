import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/app/util/util.dart';
import 'package:iqlim/presentation/controllers/auth/auth_controller.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/profile/signup_page.dart';
import 'views/button.dart';
import 'views/field.dart';

class ForgotPage extends GetView<AuthController> {
  ForgotPage({super.key});

  late TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        emailController = TextEditingController();
      },
      dispose: (state) {
        emailController.dispose();
      },
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const Appbar(),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.90,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                image: DecorationImage(
                  image: AssetImage(Utils.getImagePath('logo-secondary')),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomLeft
                )
              ),
              child: Column(
                children: [
                  Text(controller.isLoggedIn.value.toString(), style: AppTextStyles.hidden,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text("Rediscover access to your account now.", style: AppTextStyles.title,),
                        const SizedBox(height: 20),
                        Field(controller: emailController, label: "Email", type: TextInputType.emailAddress,),
                        const SizedBox(height: 20),
                        Button(onTap: () => controller.forgot(emailController.text), label: 'Forgot Password', color: AppColors.secondaryColor,),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),

                  // Image.asset(Utils.getImagePath('logo-secondary')),
                ],
              )
            ),
          )
        );
      },
    );
  }
}

