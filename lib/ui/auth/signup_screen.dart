import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/providers/auth_provider.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_app_bar.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shopping_app/utils/result.dart';
import 'package:shopping_app/utils/util.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(3, (index) => TextEditingController());
   late AuthRepo authRepo;  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    authRepo = ref.watch(authRepoProvider);

    return Scaffold(
      appBar: CustomAppBar(() {
        context.canPop();
      }),
      body: Column(
        children: [
          Row(
            children: [
              Text('Sign up', style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
          SizedBox(height: 50),
          Expanded(
            child: Container(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'name is required';
                          }
                          return null;
                        },
                        label: 'Name',
                        controller: _controllers[0],
                      ),
                      SizedBox(height: 4),
                      CustomTextFormField(
                        validator: emailValidation,
                        label: 'Email',
                        controller: _controllers[1],
                      ),
                      SizedBox(height: 4),
                      CustomTextFormField(
                        validator: passwordValidation,
                        label: 'Password',
                        controller: _controllers[2],
                      ),
                      SizedBox(height: 32),
                      CustomElevatedButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          if (_isValidate()) {
                            _onpressed(context);
                            // print(  authRepo.register());
                          }
                        },
                      ),

                      SizedBox(height: 4),

                      GestureDetector(
                        onTap: () => context.push(Routes.login),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(height: 3),
                            Image.asset('assets/icons/arrow.png'),
                          ],
                        ),
                      ),

                      //  LineAtBottom()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  _isValidate() => (_formKey.currentState?.validate());

  void _onpressed(BuildContext context) {
    final name = _controllers[0].text;
    final email = _controllers[1].text;
    final password = _controllers[2].text;

    request(context,email, password,name);
  }

  void request(BuildContext context,String email, String password, String name) async {
    print('----------------------------------------------------');
    final result = await  authRepo.register(email,password,name);
  switch (result) {
  case Ok(): {
     print(result.value);
     context.go(Routes.home);
   }
   case Error(): {
    print(result.error);
   }
 }
    print(result);
    // print(response.data);
    print('----------------------------------------------------');
  }
}
