import 'package:iqlim/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required this.name,
    required this.description,
    required this.popularity,
    required this.createdAt,
    required this.image,
    required this.id,
  }) : super(name: name, description: description, popularity: popularity, createdAt: createdAt, image: image, id: id);

  final String name;
  final String description;
  final int popularity;
  final String createdAt;
  final String image;
  final String id;

  @override
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        description: json["description"],
        popularity: json["popularity"],
        createdAt: json["createdAt"],
        image: json["image"],
        id: json["id"],
      );
}
