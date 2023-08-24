import '../../domain/entities/category.dart';
import '../../domain/entities/store.dart';

class StoreModel extends Store {
  StoreModel({
    required this.contact,
    required this.rating,
    required this.profile,
    required this.header,
    required this.title,
    required this.description,
    required this.openHour,
    required this.closeHour,
    required this.address,
    // required this.category,
    required this.lat,
    required this.lng,
    required this.id
  }) : super(contact: contact, rating: rating, profile: profile, header: header, title: title, description: description, openHour: openHour, closeHour: closeHour,
      address: address, lat: lat, lng: lng, id: id); //category: category


  final Contact contact;
  final double rating;
  final String profile;
  final String header;
  final String title;
  final String description;
  final String openHour;
  final String closeHour;
  final String address;
  // final Category category;
  final double lat;
  final double lng;
  final String id;

  @override
  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        contact: Contact(email: "", phone: ""),
        rating: json["rating"],
        profile: json["profile"],
        header: json["header"],
        title: json["title"],
        description: json["description"],
        openHour: json["openHour"],
        closeHour: json["closeHour"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
        id: json["id"],
        // category: null,
      );
}
