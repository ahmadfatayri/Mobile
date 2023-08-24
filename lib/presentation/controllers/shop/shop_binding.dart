import 'package:get/get.dart';
import 'package:iqlim/data/repositories/shop_repository.dart';
import 'package:iqlim/domain/usecases/fetch_shop_use_case.dart';
import 'package:iqlim/presentation/controllers/shop/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchShopUseCase(Get.find<ShopRepositoryIml>()));
    Get.lazyPut(() => FetchStoresUseCase(Get.find<ShopRepositoryIml>()));
    Get.lazyPut(() => FetchTypesUseCase(Get.find<ShopRepositoryIml>()));
    Get.lazyPut(() => ShopController(Get.find(), Get.find(), Get.find()));
  }
}
