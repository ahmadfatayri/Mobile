import 'package:iqlim/app/core/usecases/no_param_usecase.dart';
import 'package:iqlim/app/core/usecases/pram_usecase.dart';
import 'package:iqlim/domain/entities/paging_news.dart';
import 'package:iqlim/domain/repositories/news_repository.dart';
import 'package:tuple/tuple.dart';

import '../entities/tag.dart';

class FetchNewsTagUseCase extends NoParamUseCase<List<Tag>> {
  final NewsRepository _repo;
  FetchNewsTagUseCase(this._repo);

  @override
  Future<List<Tag>> execute() {
    return _repo.fetchTag();
  }
}

class FetchPinnedNewsUseCase extends NoParamUseCase<PagingNews> {
  final NewsRepository _repo;
  FetchPinnedNewsUseCase(this._repo);

  @override
  Future<PagingNews> execute() {
    return _repo.fetchPinned();
  }
}

class FetchNewsUseCase extends ParamUseCase<PagingNews, Tuple3<int, int, String>> {
  final NewsRepository _repo;
  FetchNewsUseCase(this._repo);

  @override
  Future<PagingNews> execute(Tuple3 param) {
    return _repo.fetchNews(param.item1, param.item2, param.item3);
  }
}

class SearchNewsUseCase extends ParamUseCase<PagingNews, String> {
  final NewsRepository _repo;
  SearchNewsUseCase(this._repo);

  @override
  Future<PagingNews> execute(String param) {
    return _repo.searchNews(param);
  }
}