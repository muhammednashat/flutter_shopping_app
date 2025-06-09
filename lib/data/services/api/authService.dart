import 'package:dio/dio.dart';
import 'package:shopping_app/utils/result.dart';

class Authservice {
  final dio = Dio();

  Future<Response> login(String email, String password) async {
    return await dio.post(
        'http://192.168.1.5:3000/api/v1/login',
        data: {
          'email': email,
          'password': password,
        },
      );
  }

  Future<Result<String>> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final response = await dio.post(
        'http://192.168.1.5:3000/api/v1/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': "541135485125",
          'address': "no address",
        },
      );

      return Result.ok("ok");
    } on Exception catch (e) {
      print(e);
      return Result.error(e);
    }
  }
}
