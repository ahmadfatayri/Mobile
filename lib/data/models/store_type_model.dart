
import 'package:iqlim/domain/entities/type.dart';

class StoreTypeModel extends StoreType {
  StoreTypeModel({
    required this.name,
    required this.tag,
    required this.image,
    required this.id,

  }) : super(name: name, tag: tag, image: image, id: id);


  final String name;
  final String tag;
  final String image;
  final String id;

  @override
  factory StoreTypeModel.fromJson(Map<String, dynamic> json) => StoreTypeModel(
        name: json["name"],
        tag: json["tag"],
        image: json["image"],
        id: json["id"],
      );
}
