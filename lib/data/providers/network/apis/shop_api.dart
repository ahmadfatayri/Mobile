
import 'package:iqlim/data/providers/network/api_endpoint.dart';
import 'package:iqlim/data/providers/network/api_provider.dart';
import 'package:iqlim/data/providers/network/api_request_representable.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/type.dart';

enum ShopType { fetchCategories, fetchStores, fetchStoreTypes }

class ShopAPI implements APIRequestRepresentable {
  final ShopType type;
  final String? tag;
  final String? search;
  final StoreType? storeType;
  final Category? category;

  ShopAPI._({required this.type, this.search, this.storeType, this.tag, this.category});

  ShopAPI.fetchCategories()
      : this._(type: ShopType.fetchCategories);

  ShopAPI.fetchStores(String search, StoreType type, Category category)
      : this._(type: ShopType.fetchStores, search: search, storeType: type, category: category);

  ShopAPI.fetchStoreTypes(String tag)
      : this._(type: ShopType.fetchStoreTypes, tag: tag);

  @override
  String get endpoint => APIEndpoint.newsapi;

  @override
  String get path {
    switch (type) {
      case ShopType.fetchCategories:
        return "/category";
      case ShopType.fetchStores:
        return "/store";
      case ShopType.fetchStoreTypes:
        return "/type";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers =>
      {};

  @override
  Map<String, String> get query {
    switch (type) {
      case ShopType.fetchCategories:
        return {"sort": "popularity"};
      case ShopType.fetchStores:
        if((category?.id ?? '').isEmpty) {
          return {};
        } else {
          if((search ?? "").isNotEmpty && (storeType?.id ?? "").isNotEmpty) {
            return {"title": search ?? "", "type": storeType?.id ?? "", "category": category?.id ?? ""};
          } else if ((search ?? "").isNotEmpty) {
            return {"title": search ?? "", "category": category?.id ?? ""};
          } else if ((storeType?.id ?? "").isNotEmpty) {
            return {"type": storeType?.id ?? "", "category": category?.id ?? ""};
          } else {
            return {"category": category?.id ?? ""};
          }
        }

      case ShopType.fetchStoreTypes:
        return {"tag": tag ?? ""};
    }
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
