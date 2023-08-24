import 'category.dart';

class Store {
  Store({
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
  });

  Contact contact;
  double rating;
  String profile;
  String header;
  String title;
  String description;
  String openHour;
  String closeHour;
  String address;
  // Category category;
  double lat;
  double lng;
  String id;
}

class Contact {
  Contact({
    required this.phone,
    required this.email,
  });

  String phone;
  String email;
}
