import 'package:shopping_app/data/services/api/user_service.dart';
import 'package:shopping_app/utils/utils.dart';

class UserRepo {
  UserRepo({required this.service});
  final UserService service;

  Future<void> uploadUserImage(String imgBase64, String userId) async {
    try {
      final response = await service.uploadUserImage(imgBase64, userId);
      print(response.statusCode);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
