import 'package:get/get.dart';
import 'package:iqlim/data/repositories/contact_repository.dart';
import 'package:iqlim/domain/usecases/contact_use_case.dart';
import 'contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUseCase(Get.find<ContactRepositoryIml>()));
    Get.lazyPut(() => ContactController(Get.find()));
  }
}
