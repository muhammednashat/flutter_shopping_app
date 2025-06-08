
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/data/services/api/authService.dart';

final authServiceProvider  = Provider((ref) => Authservice());

final authRepoProvider = Provider((ref){
 var service = ref.watch(authServiceProvider);
return AuthRepo(service: service);
});