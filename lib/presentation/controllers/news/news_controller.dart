import 'package:get/get.dart';
import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/domain/entities/paging_news.dart';
import 'package:iqlim/domain/entities/tag.dart';
import 'package:iqlim/domain/usecases/news_tags_use_case.dart';
import 'package:tuple/tuple.dart';

class NewsController extends GetxController {
  NewsController(this._fetchNewsUseCase, this._fetchNewsTaglineUseCase, this._fetchPinnedNewsUseCase, this._searchNewsUseCase);
  final FetchNewsUseCase _fetchNewsUseCase;
  final FetchNewsTagUseCase _fetchNewsTaglineUseCase;
  final FetchPinnedNewsUseCase _fetchPinnedNewsUseCase;
  final SearchNewsUseCase _searchNewsUseCase;

  int _currentPage = 1;
  int _pageSize = 10;
  var _isLoadMore = false;
  var _paging = Rx<PagingNews?>(null);

  var tags = Rx<List<Tag>?>(null);
  var news = RxList<News>([]);
  var pinnedNews = RxList<News>([]);
  var selectedTag = Tag(name: "All", id: "").obs;

  fetchTagData() async {
    final tagsData = await _fetchNewsTaglineUseCase.execute();
    tagsData.insert(0, Tag(name: "All", id: ""));
    tags.value = tagsData;
  }

  changeTag(Tag tag) async {
    selectedTag.value = tag;
    resetPaginate();
    final newPaging = await _fetchNewsUseCase
        .execute(Tuple3(_currentPage, _pageSize, tag.id));
    news.assignAll(newPaging.news);
  }

  handleTextChanged(String value) async {
    if(value.isEmpty) {
      news.assignAll(_paging.value?.news ?? []);
      return;
    }
    if(value.length < 2) {
      return;
    }
    selectedTag.value = Tag(name: "All", id: "");
    final newPaging = await _searchNewsUseCase.execute(value);
    news.assignAll(newPaging.news);
  }

  fetchData() async {
    _currentPage = 1;
    final newPaging = await _fetchNewsUseCase
        .execute(Tuple3(_currentPage, _pageSize, selectedTag.value.id));
    news.assignAll(newPaging.news);
    _paging.value = newPaging;
  }

  fetchPinned() async {
    final newPaging = await _fetchPinnedNewsUseCase.execute();
    pinnedNews.assignAll(newPaging.news);
  }

  loadMore() async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _fetchNewsUseCase
        .execute(Tuple3(_currentPage, _pageSize, selectedTag.value.id));
    news.addAll(newPaging.news);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }

  resetPaginate() {
    _currentPage = 1;
    _pageSize = 10;
    _isLoadMore = false;
  }
}
