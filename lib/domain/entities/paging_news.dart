import 'package:iqlim/domain/entities/news.dart';

class PagingNews {
  PagingNews({
    required this.totalResults,
    required this.news,
  });

  int totalResults;
  List<News> news;
}
