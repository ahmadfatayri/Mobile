import 'package:flutter/material.dart';
import 'package:iqlim/presentation/pages/headline/headline_page.dart';
import 'package:iqlim/presentation/pages/news/news_page.dart';
import 'package:iqlim/presentation/pages/profile/profile_page.dart';
import 'package:iqlim/presentation/pages/shop/shop_page.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';

enum TabType { shop, offers, news, basket }

extension TabItem on TabType {
  Icon get icon {
    switch (this) {
      case TabType.shop:
        return const Icon(Elusive.home, size: 25);
      case TabType.offers:
        return const Icon(Elusive.tag, size: 30);
      case TabType.news:
        return const Icon(Entypo.picture, size: 25);
      case TabType.basket:
        return const Icon(Entypo.bag, size: 25);
    }
  }

  String get title {
    switch (this) {
      case TabType.shop:
        return "Shop";
      case TabType.offers:
        return "Offers";
      case TabType.basket:
        return "Cart";
      case TabType.news:
        return "News";
    }
  }

  Widget get widget {
    switch (this) {
      case TabType.shop:
        return const ShopPage();
      case TabType.news:
        return NewsPage();
      case TabType.offers:
        return const ProfilePage();
      case TabType.basket:
        return HeadlinePage();
    }
  }
}
