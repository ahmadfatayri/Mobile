import 'package:iqlim/app/core/usecases/no_param_usecase.dart';
import 'package:iqlim/app/core/usecases/pram_usecase.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/domain/entities/type.dart';
import 'package:iqlim/domain/repositories/shop_repository.dart';
import 'package:tuple/tuple.dart';

class FetchShopUseCase extends NoParamUseCase<List<Category>> {
  final ShopRepository _repo;
  FetchShopUseCase(this._repo);

  @override
  Future<List<Category>> execute() {
    return _repo.fetchCategories();
  }
}

class FetchStoresUseCase extends ParamUseCase<List<Store>, Tuple3<String, StoreType, Category>> {
  final ShopRepository _repo;
  FetchStoresUseCase(this._repo);

  @override
  Future<List<Store>> execute(Tuple3<String, StoreType, Category> param) {
    return _repo.fetchStores(param.item1, param.item2, param.item3);
  }
}

class FetchTypesUseCase extends ParamUseCase<List<StoreType>, String> {
  final ShopRepository _repo;
  FetchTypesUseCase(this._repo);

  @override
  Future<List<StoreType>> execute(String param) {
    return _repo.fetchTypes(param);
  }
}
