import 'package:hive/hive.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/data/services/api/authService.dart';
import 'package:shopping_app/utils/result.dart';

class AuthRepo {
  final Authservice service;
  final BoxCollection boxCollection;

  AuthRepo({required this.service, required this.boxCollection});

  Future<Result<String>> login(String email, String password) async {
    try {
      final response = await service.login(email, password);
      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        print(json);
        final user = User.fromJson(json);
        await storeUserLocaly(user);
        return Result.ok("ok");
      } else {
        return Result.error(new Exception());
      }
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
      final response = await service.register(email, password, name);
      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final user = User.fromJson(json);
         print(json);
        await storeUserLocaly(user);
        return Result.ok('ok');
      } else {
        return Result.error(Exception('${response.statusCode}'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }


  Future<void> storeUserLocaly(User value) async {
    final useresBox = await boxCollection.openBox('useres');
    final appData = await boxCollection.openBox('appData');
    // print('=========================');
    // final user = await useresBox.get('user') as User;
    // print(user.toString());
    // print('=========================');

    await appData.put('isLogged', true);
    await useresBox.put('user', value);
  }
}
