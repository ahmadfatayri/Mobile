import 'package:get/get.dart';
import 'package:iqlim/data/repositories/news_repository.dart';
import 'package:iqlim/domain/usecases/news_tags_use_case.dart';
import 'package:iqlim/presentation/controllers/news/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNewsUseCase(Get.find<NewsRepositoryIml>()));
    Get.lazyPut(() => FetchPinnedNewsUseCase(Get.find<NewsRepositoryIml>()));
    Get.lazyPut(() => FetchNewsTagUseCase(Get.find<NewsRepositoryIml>()));
    Get.lazyPut(() => SearchNewsUseCase(Get.find<NewsRepositoryIml>()));
    Get.lazyPut(() => NewsController(Get.find(), Get.find(), Get.find(), Get.find()));

  }
}
