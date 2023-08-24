import 'package:iqlim/domain/entities/article.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.articles,
  });

  int totalResults;
  List<Article> articles;
}
