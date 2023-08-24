import 'package:get/get.dart';
import 'package:iqlim/data/repositories/auth_repository.dart';
import 'package:iqlim/data/repositories/article_repository.dart';
import 'package:iqlim/data/repositories/contact_repository.dart';
import 'package:iqlim/data/repositories/news_repository.dart';
import 'package:iqlim/data/repositories/shop_repository.dart';
import 'package:iqlim/presentation/controllers/home/home_controller.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthenticationRepositoryIml());
    Get.lazyPut(() => ArticleRepositoryIml());
    Get.lazyPut(() => ShopRepositoryIml());
    Get.lazyPut(() => NewsRepositoryIml());
    Get.lazyPut(() => ContactRepositoryIml());
  }
}

class ControllerCreator {
  static init() {
    Get.lazyPut(() => HomeController());
  }
}
