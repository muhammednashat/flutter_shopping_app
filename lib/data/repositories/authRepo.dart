import 'package:shopping_app/data/services/api/authService.dart';
import 'package:shopping_app/utils/result.dart';

class AuthRepo {
  final Authservice service;

  AuthRepo({required this.service});

  Future<Result<String>> login(String email, String password) =>
      service.login(email, password);

  Future<Result<String>> register(String email, String password, String name) =>
      service.register(email, password, name);
}
