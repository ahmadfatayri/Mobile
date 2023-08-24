import 'package:iqlim/domain/entities/tag.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tag_model.g.dart';

@JsonSerializable()
class TagModel extends Tag {
  TagModel({
    this.name,
    this.id,
  }) : super(
            name: name,
            id: id,);

  String? name;
  String? id;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
