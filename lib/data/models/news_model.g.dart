// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    author: json['author'] as String?,
    title: json['title'] as String?,
    source: json['source'] as String?,
    popularity: json['popularity'] as int?,
    image: json['image'] as String?,
    publishedAt: json['publishedAt'] == null
        ? null
        : DateTime.parse(json['publishedAt'] as String),
    content: json['content'] as String?,
    newsTag: TagModel.fromJson(json['newsTag'])
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'source': instance.source,
      'popularity': instance.popularity,
      'image': instance.image,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
      'newsTag': instance.newsTag,
    };
