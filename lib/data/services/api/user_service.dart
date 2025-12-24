import 'package:dio/dio.dart';
import 'package:shopping_app/utils/constants.dart';

class UserService {
  final dio = Dio();

  Future<Response> uploadUserImage(String imgBase64, String userId) async {
    return dio.post(
      '${Constants.baseUrl}/upload_user_image',
      data: {"imgBase64": imgBase64, "userId": userId},
    );
  }
}
