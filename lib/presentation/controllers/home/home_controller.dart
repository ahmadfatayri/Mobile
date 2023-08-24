import 'package:get/get.dart';
import 'package:iqlim/app/library/whatsapp/whatsapp.dart';
import 'package:iqlim/app/services/local_storage.dart';
import 'package:iqlim/app/types/tab_type.dart';
import 'package:iqlim/presentation/controllers/headline/headline_binding.dart';
import 'package:iqlim/presentation/controllers/news/news_binding.dart';
import 'package:iqlim/presentation/controllers/shop/shop_binding.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  HomeController();
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ShopBinding().dependencies();
  }

  onItemChanged(int index) {
    final type = TabType.values[index];
    switch (type) {
      case TabType.shop:
        ShopBinding().dependencies();
        break;
      case TabType.news:
        NewsBinding().dependencies();
        break;
      case TabType.basket:
        HeadlineBinding().dependencies();
        break;
      case TabType.offers:
        break;
    }
    selectedIndex.value = index;
  }

  openSupport() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+96176006297',
      text: "Hey! I'm inquiring about",
    );
    await launchUrl(link.asUri());
  }

}