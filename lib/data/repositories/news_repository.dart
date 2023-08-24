import 'package:iqlim/data/models/news_paging_model.dart';
import 'package:iqlim/data/models/tag_model.dart';
import 'package:iqlim/data/providers/network/apis/news_api.dart';
import 'package:iqlim/domain/entities/paging_news.dart';
import 'package:iqlim/domain/entities/tag.dart';
import 'package:iqlim/domain/repositories/news_repository.dart';

class NewsRepositoryIml extends NewsRepository {
  @override
  Future<PagingNews> fetchNews(int page, int pageSize, String tag) async {
    final response = await NewsAPI.fetchNews(page, pageSize, tag).request();
    return NewsPagingModel.fromJson(response);
  }

  @override
  Future<List<Tag>> fetchTag() async {
    final response = await NewsAPI.fetchTags().request();
    List<Tag> arr = [];
    for(var res in response['data']) {
      arr.add(TagModel.fromJson(res));
    }
    return arr;
  }

  @override
  Future<PagingNews> fetchPinned() async {
    final response = await NewsAPI.fetchPinned().request();
    return NewsPagingModel.fromJson(response);
  }

  @override
  Future<PagingNews> searchNews(String key) async {
    final response = await NewsAPI.search(key).request();
    return NewsPagingModel.fromJson(response);
  }
}
