import 'package:get/get.dart';
import 'package:iqlim/data/repositories/auth_repository.dart';
import 'package:iqlim/domain/usecases/auth_use_case.dart';
import 'package:iqlim/presentation/controllers/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.lazyPut(() => SignInUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.lazyPut(() => ForgotUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.put(AuthController(Get.find(), Get.find(), Get.find()), permanent: true);
  }
}
