import 'package:iqlim/domain/entities/paging_news.dart';

import '../entities/tag.dart';

abstract class NewsRepository {
  Future<PagingNews> fetchNews(int page, int pageSize, String tag);
  Future<PagingNews> fetchPinned();
  Future<PagingNews> searchNews(String key);
  Future<List<Tag>> fetchTag();
}
