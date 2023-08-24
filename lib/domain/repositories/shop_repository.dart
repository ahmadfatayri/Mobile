import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/domain/entities/type.dart';

abstract class ShopRepository {
  Future<List<Category>> fetchCategories();
  Future<List<Store>> fetchStores(String search, StoreType type, Category category);
  Future<List<StoreType>> fetchTypes(String tag);

}
