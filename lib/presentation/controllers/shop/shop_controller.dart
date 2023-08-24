import 'package:get/get.dart';
import 'package:iqlim/app/config/app_constants.dart';
import 'package:iqlim/domain/entities/category.dart';
import 'package:iqlim/domain/entities/store.dart';
import 'package:iqlim/domain/entities/type.dart';
import 'package:iqlim/domain/usecases/fetch_shop_use_case.dart';
import 'package:iqlim/presentation/pages/shop/category_store_page.dart';
import 'package:tuple/tuple.dart';

class ShopController extends GetxController {
  ShopController(this._fetchShopUseCase, this._fetchStoresUseCase, this._fetchTypesUseCase);
  final FetchShopUseCase _fetchShopUseCase;
  final FetchStoresUseCase _fetchStoresUseCase;
  final FetchTypesUseCase _fetchTypesUseCase;

  var categories = RxList<Category>([]);
  var stores = RxList<Store>([]);
  var types = RxList<StoreType>([]);
  var selectedStoreType = StoreType(name: '', tag: '', image: '', id: '').obs;
  late var category;

  fetchData() async {
    final newPaging = await _fetchShopUseCase.execute();
    categories.assignAll(newPaging);
  }

  fetchStores(Category category) async {
    this.category = category;
    final newPaging = await _fetchStoresUseCase.execute(Tuple3("", selectedStoreType.value, category ));
    stores.assignAll(newPaging);
  }

  fetchStoreTypes(String tag) async {
    final newPaging = await _fetchTypesUseCase.execute(tag);
    newPaging.insert(0, StoreType(name: 'All', tag: '', image: AppTextConstant.all_url, id: ''));
    types.assignAll(newPaging);
  }

  openCategory(Category cat) {
    String name = cat.name.toLowerCase();
    String handle;
    switch (name) {
      case 'food':
        handle = 'food';
        break;
      case 'grocery':
        handle = 'grocery';
        break;
      case 'bakery':
        handle = 'bakery';
        break;
      case 'fashion':
        handle = 'fashion';
        break;
      default:
        handle = 'all';
        break;
    }
    Get.to(CategoryStorePage(category: cat, handle: handle,))?.then((value) {
      fetchStores(Category(name: '', image: '', id: '', createdAt: '', popularity: 10, description: ''));
      selectedStoreType.value = StoreType(name: '', tag: '', image: '', id: '');
      // fetchStoreTypes(handle);
    });
  }

  handleTextChanged(String value) async {
    if(value.isEmpty) {
      fetchStores(category);
      return;
    }
    if(value.length < 2) {
      return;
    }
    selectedStoreType.value = StoreType(name: '', tag: '', image: '', id: '');
    final newPaging = await _fetchStoresUseCase.execute(Tuple3(value, selectedStoreType.value, category));
    stores.assignAll(newPaging);
  }

  changeType(StoreType type) async {
    selectedStoreType.value = type;
    // resetPaginate();
    final newPaging = await _fetchStoresUseCase
        .execute(Tuple3("", type, category));
    stores.assignAll(newPaging);
  }
}
