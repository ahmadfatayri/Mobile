import 'package:iqlim/data/providers/network/api_endpoint.dart';
import 'package:iqlim/data/providers/network/api_provider.dart';
import 'package:iqlim/data/providers/network/api_request_representable.dart';

enum NewsType { fetchTags, fetchNews, fetchPinned, search }

class NewsAPI implements APIRequestRepresentable {
  final NewsType type;
  int? page;
  int? pageSize;
  String? keyword;
  String? tag;

  NewsAPI._({required this.type, this.page, this.pageSize, this.keyword, this.tag});

  NewsAPI.fetchTags()
      : this._(type: NewsType.fetchTags,);
  NewsAPI.fetchPinned()
      : this._(type: NewsType.fetchPinned,);
  NewsAPI.search(String key)
      : this._(type: NewsType.search, keyword: key);
  NewsAPI.fetchNews(int page, int pageSize, String tag)
      : this._(
            type: NewsType.fetchNews,
            page: page,
            pageSize: pageSize,
            tag: tag);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
    switch (type) {
      case NewsType.fetchTags:
        return "/news-tag";
      case NewsType.fetchNews:
        return "/news";
      case NewsType.fetchPinned:
        return "/news";
      case NewsType.search:
        return "/news/search/$keyword";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {};

  Map<String, String> get query {
    switch (type) {
      case NewsType.fetchTags:
        return {"page": "$page", "limit": "$pageSize"};
      case NewsType.fetchNews:
        return {"page": "$page", "limit": "$pageSize", tag != '' ? 'newsTag' : '': "$tag"};
      case NewsType.fetchPinned:
        return {"popularity[lte]": "50"};
      case NewsType.search:
        return {};
    }
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
