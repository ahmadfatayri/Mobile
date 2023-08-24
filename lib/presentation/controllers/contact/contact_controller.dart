import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/domain/usecases/contact_use_case.dart';
import 'package:tuple/tuple.dart';

class ContactController extends GetxController {
  ContactController(this._contactUseCase);
  final ContactUseCase _contactUseCase;

  var isSent = false.obs;

  sendData(String name, String phone, String message) async {
    if(name.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "Please provide a valid name.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }

    if(!phone.isPhoneNumber || phone.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "Please provide a valid phone.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }

    if(message.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "Please provide a valid message.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }

    final res = await _contactUseCase.execute(Tuple3(name, phone, message));
    isSent.value = res;
    Get.snackbar(
      "Thank you for your message",
      "We will get back to you soon",
    );
  }
}
