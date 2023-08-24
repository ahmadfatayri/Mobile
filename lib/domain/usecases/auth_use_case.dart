import 'package:iqlim/app/core/usecases/pram_usecase.dart';
import 'package:iqlim/domain/entities/user.dart';
import 'package:iqlim/domain/repositories/auth_repository.dart';
import 'package:tuple/tuple.dart';

class SignUpUseCase extends ParamUseCase<User, Tuple4<String, String, String, String>> {
  final AuthenticationRepository _repo;
  SignUpUseCase(this._repo);

  @override
  Future<User> execute(Tuple4 param) {
    return _repo.signUp(param.item1, param.item2, param.item3, param.item4);
  }
}

class SignInUseCase extends ParamUseCase<User, Tuple2<String, String>> {
  final AuthenticationRepository _repo;
  SignInUseCase(this._repo);

  @override
  Future<User> execute(Tuple2 params) {
    return _repo.signIn(params.item1, params.item2);
  }
}

class ForgotUseCase extends ParamUseCase<bool, String> {
  final AuthenticationRepository _repo;
  ForgotUseCase(this._repo);

  @override
  Future<bool> execute(String params) {
    return _repo.forgot(params);
  }
}
