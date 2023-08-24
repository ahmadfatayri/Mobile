import 'package:iqlim/data/providers/network/apis/contact_api.dart';
import 'package:iqlim/domain/repositories/contact_repository.dart';

class ContactRepositoryIml extends ContactRepository {
  @override
  Future<bool> contact(String name, String phone, String message) async {
      await ContactAPI.contact(name, phone, message).request();
      return true;
  }
}
