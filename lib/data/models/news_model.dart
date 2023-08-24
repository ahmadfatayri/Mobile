import 'package:iqlim/domain/entities/news.dart';
import 'package:iqlim/domain/entities/tag.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tag_model.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends News {
  NewsModel({
    this.author,
    this.title,
    this.source,
    this.popularity,
    this.image,
    this.publishedAt,
    this.content,
    this.newsTag
  }) : super(
            author: author,
            title: title,
            source: source,
            popularity: popularity,
            image: image,
            publishedAt: publishedAt,
            newsTag: newsTag,
            content: content);

  String? author;
  String? title;
  String? source;
  int? popularity;
  String? image;
  DateTime? publishedAt;
  String? content;
  Tag? newsTag;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
