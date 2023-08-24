import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iqlim/domain/entities/user.dart';

enum _Key {
  user,
}

class LocalStorageService extends GetxService {
  GetStorage? _storage;
  Future<LocalStorageService> init() async {
    _storage = GetStorage();
    return this;
  }

  User? get user {
    final rawJson = _storage?.read(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJsonLocal(map);
  }

  set user(User? value) {
    if (value != null) {
      _storage?.write(
          _Key.user.toString(), json.encode(value.toJson()));
    } else {
      _storage?.remove(_Key.user.toString());
    }
  }

  emptyDB() {
    _storage?.erase();
  }
}
