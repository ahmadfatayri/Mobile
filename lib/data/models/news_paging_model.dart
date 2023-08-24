import 'package:iqlim/domain/entities/paging_news.dart';
import 'news_model.dart';

class NewsPagingModel extends PagingNews {
  NewsPagingModel({
    required this.totalResults,
    required this.news,
  }) : super(news: news, totalResults: totalResults);

  final int totalResults;
  final List<NewsModel> news;

  @override
  factory NewsPagingModel.fromJson(Map<String, dynamic> json) => NewsPagingModel(
        totalResults: json["totalResults"],
        news:
            List.from(json["data"].map((x) => NewsModel.fromJson(x))),
      );
}
