import 'package:iqlim/data/models/paging_model.dart';
import 'package:iqlim/data/providers/network/apis/article_api.dart';
import 'package:iqlim/domain/repositories/article_repository.dart';

class ArticleRepositoryIml extends ArticleRepository {
  @override
  Future<PagingModel> fetchHeadline(int page, int pageSize) async {
    final response = await ArticleAPI.fetchHeadline(page, pageSize).request();
    return PagingModel.fromJson(response);
  }

  @override
  Future<PagingModel> fetchNewsByCategory(
      String keyword, int page, int pageSize) async {
    final response =
        await ArticleAPI.fetchNews(keyword, page, pageSize).request();
    return PagingModel.fromJson(response);
  }
}
