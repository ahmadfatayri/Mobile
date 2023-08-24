import 'package:iqlim/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> signUp(String name, String phone, String email, String pass);
  Future<User> signIn(String email, String pass);
  Future<bool> forgot(String email);
}
