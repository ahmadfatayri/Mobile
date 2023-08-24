import 'package:iqlim/app/core/usecases/pram_usecase.dart';
import 'package:iqlim/domain/repositories/contact_repository.dart';
import 'package:tuple/tuple.dart';

class ContactUseCase extends ParamUseCase<bool, Tuple3<String, String, String>> {
  final ContactRepository _repo;
  ContactUseCase(this._repo);

  @override
  Future<bool> execute(Tuple3 param) {
    return _repo.contact(param.item1, param.item2, param.item3);
  }
}
