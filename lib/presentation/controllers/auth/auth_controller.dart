import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iqlim/app/config/app_colors.dart';
import 'package:iqlim/app/services/local_storage.dart';
import 'package:iqlim/data/providers/network/api_provider.dart';
import 'package:iqlim/domain/entities/user.dart';
import 'package:iqlim/domain/usecases/auth_use_case.dart';
import 'package:iqlim/presentation/pages/home/home_page.dart';
import 'package:tuple/tuple.dart';

class AuthController extends GetxController {
  AuthController(this._signUpUseCase, this._signInUseCase, this._forgotUseCase);
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final ForgotUseCase _forgotUseCase;

  final store = Get.find<LocalStorageService>();
  var isLoggedIn = false.obs;
  Rx<User?> get user => store.user.obs;


  signUpWith(String name, String phone, String email, String pass) async {
    bool hasError = false;
    String message = "";

    if(pass.length < 8) {
      hasError = true;
      message = "Please provide a valid password.";
    }
    if(!email.isEmail) {
      hasError = true;
      message = "Please provide a valid email.";
    }
    if(!phone.isPhoneNumber) {
      hasError = true;
      message = "Please provide a valid phone. +961 *******";
    }
    if(name.isEmpty) {
      hasError = true;
      message = "Please provide a valid name.";
    }
    if(hasError) {
      Get.snackbar(
        "Validation Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }
    try {
      EasyLoading.show(status: 'loading...');
      final user = await _signUpUseCase.execute(Tuple4(name, phone, email, pass));
      store.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
      Get.snackbar(
        "Welcome ${user.name}",
        "",
      );
      EasyLoading.dismiss();
      Get.off(() => const HomePage());
    }
    on UnauthorisedException catch (_) {
      if (kDebugMode) {
        print(_.message);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        _.message,
        _.details,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
    on BadRequestException catch (_) {
      if (kDebugMode) {
        print(_.message);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        _.message,
        _.details,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
    catch (error) {
      if (kDebugMode) {
        print(error);
      }
      EasyLoading.dismiss();
    }
  }

  signInWith(String email, String pass) async {
    bool hasError = false;
    String message = "";
    if(!email.isEmail) {
      hasError = true;
      message = "Please provide a valid email.";
    }
    if(pass.length < 8) {
      hasError = true;
      message = "Please provide a valid password.";
    }
    if(hasError) {
      Get.snackbar(
        "Validation Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }
    try {
      EasyLoading.show(status: 'loading...');
      final user = await _signInUseCase.execute(Tuple2(email, pass));
      store.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
      Get.snackbar(
        "Welcome ${user.name}",
        "",
      );
      EasyLoading.dismiss();
      Get.off(() => const HomePage());
    }
    on UnauthorisedException catch (_) {
      if (kDebugMode) {
        print(_.message);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        _.message,
        _.details,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
    on BadRequestException catch (_) {
      if (kDebugMode) {
        print(_.message);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        _.message,
        _.details,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
    catch (error) {
      if (kDebugMode) {
        print(error);
      }
      EasyLoading.dismiss();
    }
  }

  logout() {
    store.user = null;
    isLoggedIn.value = false;
    Get.off(() => const HomePage());
  }

  forgot(String email) async {
    if(!email.isEmail) {
      Get.snackbar(
        "Validation Error",
        "Please provide a valid email.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
      return;
    }

    try {
      EasyLoading.show(status: 'loading...');
      await _forgotUseCase.execute(email);
      Get.snackbar(
        "Check your inbox",
        "",
      );
      EasyLoading.dismiss();
    }
    on BadRequestException catch (_) {
      if (kDebugMode) {
        print(_.message);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        _.message,
        _.details,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
    catch (error) {
      if (kDebugMode) {
        print(error);
      }
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "Please try again later",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorColor,
        colorText: AppColors.white,
      );
    }
  }
}
