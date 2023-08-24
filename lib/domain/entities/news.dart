import 'package:iqlim/data/models/tag_model.dart';
import 'package:iqlim/domain/entities/tag.dart';

class News {
  News({
    this.author,
    this.title,
    this.source,
    this.popularity,
    this.image,
    this.publishedAt,
    this.content,
    this.newsTag
  });

  String? author;
  String? title;
  String? source;
  int? popularity;
  String? image;
  DateTime? publishedAt;
  String? content;
  Tag? newsTag;
}
