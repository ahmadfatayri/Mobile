import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/app/util/util.dart';
import 'package:iqlim/presentation/controllers/auth/auth_controller.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';
import 'package:iqlim/presentation/pages/profile/signin_page.dart';
import 'views/button.dart';
import 'views/field.dart';

class SignupPage extends GetView<AuthController> {
  SignupPage({super.key});

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        nameController = TextEditingController();
        phoneController = TextEditingController();
        emailController = TextEditingController();
        passController = TextEditingController();
      },
      dispose: (state) {
        nameController.dispose();
        phoneController.dispose();
        emailController.dispose();
        passController.dispose();
      },
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const Appbar(),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.95,
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
                        Text("Get started on your UniServe journey by creating a new account.", style: AppTextStyles.title,),
                        const SizedBox(height: 20),
                        Field(controller: nameController, label: "Name", type: TextInputType.name,),
                        const SizedBox(height: 10),
                        Field(controller: phoneController, label: "Phone", type: TextInputType.phone,),
                        const SizedBox(height: 10),
                        Field(controller: emailController, label: "Email", type: TextInputType.emailAddress,),
                        const SizedBox(height: 10),
                        Field(controller: passController, label: "Password", type: TextInputType.visiblePassword,),
                        const SizedBox(height: 20),
                        Button(onTap: () => controller.signUpWith(nameController.text, phoneController.text, emailController.text, passController.text), label: 'Sign up', color: AppColors.secondaryColor,),
                        const SizedBox(height: 5),
                        TextButton(
                          child: Text("I already have an account", style: AppTextStyles.text_button,),
                          onPressed: () => Get.off(() => SignInPage()),
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

