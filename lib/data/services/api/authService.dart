import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/utils/result.dart';

class Authservice {
  final dio = Dio();

  Future<Result<String>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'http://192.168.1.5:3000/api/v1/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Result.ok("ok");
    } on Exception catch (error) {
      return Result.error(error);
    }
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
