import 'dart:io';
import 'package:iqlim/data/providers/network/api_endpoint.dart';
import 'package:iqlim/data/providers/network/api_provider.dart';
import 'package:iqlim/data/providers/network/api_request_representable.dart';

enum AuthType { login, logout, signup, forgot }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? name;
  String? email;
  String? phone;
  String? password;

  AuthAPI._({required this.type, this.password, this.name, this.email, this.phone});

  AuthAPI.login(String email, String password) : this._(type: AuthType.login, email: email, password: password);
  AuthAPI.forgot(String email) : this._(type: AuthType.forgot, email: email);
  AuthAPI.register(String name, String phone, String email, String password, )
      : this._(type: AuthType.signup, name: name, password: password, email: email, phone: phone);

  @override
  String get endpoint => APIEndpoint.newsapi;

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return "/users/login";
      case AuthType.logout:
        return "/users/logout";
      case AuthType.signup:
        return "/users/signup";
      case AuthType.forgot:
        return "/users/forgotPassword";
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, String> get query {
    return {};
  }

  @override
  dynamic get body {
    switch (type) {
      case AuthType.login:
        return {"email": email!, "password": password!};
      case AuthType.logout:
        return {};
      case AuthType.signup:
        return {"email": email!, "password": password!, "name": name!, "phone": phone!};
      case AuthType.forgot:
        return {"email": email!};
      default:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
