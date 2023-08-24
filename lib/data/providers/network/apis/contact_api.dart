
import 'package:iqlim/data/providers/network/api_endpoint.dart';
import 'package:iqlim/data/providers/network/api_provider.dart';
import 'package:iqlim/data/providers/network/api_request_representable.dart';

enum ContactType { sendMessage }

class ContactAPI implements APIRequestRepresentable {
  final ContactType type;
  String? name;
  String? phone;
  String? message;

  ContactAPI._({required this.type, this.name, this.phone, this.message});

  ContactAPI.contact(String name, String phone, String message)
      : this._(type: ContactType.sendMessage, name: name, phone: phone, message: message);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
    switch (type) {
      case ContactType.sendMessage:
        return "/contact";

    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  Map<String, String> get headers =>
      {};

  Map<String, String> get query {
    switch (type) {
      case ContactType.sendMessage:
        return {};
    }
  }

  @override
  get body => {"name": name!, "phone": phone!, "message": message!};

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
