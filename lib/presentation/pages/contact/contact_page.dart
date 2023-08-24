import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_text_styles.dart';
import 'package:iqlim/presentation/controllers/contact/contact_controller.dart';
import 'package:iqlim/presentation/pages/contact/views/button.dart';
import 'package:iqlim/presentation/pages/contact/views/field.dart';
import 'package:iqlim/presentation/pages/global_views/app_bar.dart';

class ContactPage extends GetView<ContactController> {
  ContactPage({super.key});

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        nameController = TextEditingController();
        phoneController = TextEditingController();
        messageController = TextEditingController();
      },
      dispose: (state) {
        nameController.dispose();
        phoneController.dispose();
        messageController.dispose();
      },
      builder: (_) {
        return Scaffold(
          appBar: const Appbar(),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(

                children: [
                  Text("${controller.isSent.value}", style: AppTextStyles.hidden,),
                  const SizedBox(height: 50),
                  Text("Contact us", style: AppTextStyles.bigTitle,),
                  const SizedBox(height: 10),
                  Text("Leave us a message, we will get contact with you as soon as possible", style: AppTextStyles.title,),
                  const SizedBox(height: 50),
                  Field(controller: nameController, label: "Name", type: TextInputType.name,),
                  const SizedBox(height: 10),
                  Field(controller: phoneController, label: "Phone", type: TextInputType.phone,),
                  const SizedBox(height: 10),
                  Field(controller: messageController, label: "Message", type: TextInputType.multiline,),
                  const SizedBox(height: 50),
                  Button(onTap: () => controller.sendData(nameController.text, phoneController.text, messageController.text),),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: controller.isSent.value,
                    child: Center(child: Text("We will contact you soon", style: AppTextStyles.body,),)
                  )
                ],
              ),
            ),
          )
        );
      },
    );
  }

}

