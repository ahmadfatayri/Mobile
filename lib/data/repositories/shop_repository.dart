import 'package:iqlim/data/models/category_model.dart';
import 'package:iqlim/data/models/store_model.dart';
import 'package:iqlim/data/models/store_type_model.dart';
import 'package:iqlim/data/providers/network/apis/shop_api.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/domain/entities/type.dart';
import 'package:iqlim/domain/repositories/shop_repository.dart';

class ShopRepositoryIml extends ShopRepository {

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await ShopAPI.fetchCategories().request();
    List<Category> arr = [];
    try {
      for(var res in response['data']) {
        arr.add(CategoryModel.fromJson(res));
      }
    } catch (ex) {}
    return arr;
  }

  @override
  Future<List<Store>> fetchStores(String search, StoreType type, Category category) async {
    final response = await ShopAPI.fetchStores(search, type, category).request();
    List<Store> arr = [];
    try {
      for(var res in response['data']) {
        arr.add(StoreModel.fromJson(res));
      }
    } catch (ex) {}
    return arr;
  }

  @override
  Future<List<StoreType>> fetchTypes(String tag) async {
    final response = await ShopAPI.fetchStoreTypes(tag).request();
    List<StoreType> arr = [];
    try {
      for(var res in response['data']) {
        arr.add(StoreTypeModel.fromJson(res));
      }
    } catch (ex) {}
    return arr;
  }
}
