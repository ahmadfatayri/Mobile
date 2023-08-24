import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/app/util/util.dart';
import 'package:iqlim/presentation/controllers/auth/auth_controller.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/profile/forgot_page.dart';
import 'package:iqlim/presentation/pages/profile/signup_page.dart';
import 'views/button.dart';
import 'views/field.dart';

class SignInPage extends GetView<AuthController> {
  SignInPage({super.key});

  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        emailController = TextEditingController();
        passController = TextEditingController();
      },
      dispose: (state) {
        emailController.dispose();
        passController.dispose();
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.isLoggedIn.value.toString(), style: AppTextStyles.hidden,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text("Get started on your UniServe journey by logged in.", style: AppTextStyles.title,),
                        const SizedBox(height: 20),
                        Field(controller: emailController, label: "Email", type: TextInputType.emailAddress,),
                        const SizedBox(height: 10),
                        Field(controller: passController, label: "Password", type: TextInputType.visiblePassword,),
                        const SizedBox(height: 20),
                        Button(onTap: () => controller.signInWith(emailController.text, passController.text), label: 'Sign in', color: AppColors.secondaryColor,),
                        const SizedBox(height: 5),
                        TextButton(
                          child: Text("I don't have an account, Create new one", style: AppTextStyles.text_button,),
                          onPressed: () => Get.off(() => SignupPage()),
                        ),
                        TextButton(
                          child: Text("Forgot password?", style: AppTextStyles.text_button,),
                          onPressed: () => Get.to(() => ForgotPage()),
                        )
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

