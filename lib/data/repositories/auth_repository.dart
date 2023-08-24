import 'package:iqlim/data/providers/network/apis/auth_api.dart';
import 'package:iqlim/domain/entities/user.dart';
import 'package:iqlim/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<User> signUp(String name, String phone, String email, String pass) async {
    final response = await AuthAPI.register(name, phone, email, pass).request();
    return User.fromJson(response);
  }

  @override
  Future<User> signIn(String email, String pass) async {
    final response = await AuthAPI.login(email, pass).request();
    return User.fromJson(response);
  }

  @override
  Future<bool> forgot(String email) async {
    await AuthAPI.forgot(email).request();
    return true;
  }
}
