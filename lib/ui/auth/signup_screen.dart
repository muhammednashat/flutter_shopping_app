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
                        validator: _emailValidation,
                        label: 'Email',
                        controller: _controllers[1],
                      ),
                      SizedBox(height: 4),
                      CustomTextFormField(
                        validator: _passwordValidation,
                        label: 'Password',
                        controller: _controllers[2],
                      ),
                      SizedBox(height: 32),
                      CustomElevatedButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          if (_isValidate()) {
                            _onpressed();
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

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'email is required';
    }
    var regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regExp.hasMatch(value)) {
      return 'This email is not valid';
    }
    return null;
  }

  String? _passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }
    if (value.length < 8) {
      return 'password must be grater then 8 chars';
    }
    return null;
  }

  // _isValidate() => (_formKey.currentState?.validate());
  _isValidate() => true;

  void _onpressed() {
    final name = _controllers[0].text;
    final email = _controllers[1].text;
    final password = _controllers[2].text;

    request(email, password,name);
  }

  void request(String email, String password, String name) async {
    print('----------------------------------------------------');
    final result = await  authRepo.register(email,password,name);
    print(result);
    // print(response.data);
    print('----------------------------------------------------');
  }
}
