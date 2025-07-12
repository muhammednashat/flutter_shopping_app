import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_app_bar.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/ui/core/ui/line_at_bottom.dart';
import 'package:shopping_app/ui/core/ui/loading_indecator.dart';
import 'package:shopping_app/utils/result.dart';
import 'package:shopping_app/utils/util.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _controllers = List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Log In', () {
        context.pop();
      }),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: emailValidation,
                        label: 'Email',
                        controller: _controllers[0],
                      ),
                      SizedBox(height: 4),
                      CustomTextFormField(
                        validator: passwordValidation,
                        label: 'Password',
                        controller: _controllers[1],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32),
                CustomElevatedButton(
                  text: 'LOGIN',
                  onPressed: () {
                    if (_isValidate()) {
                      _onpressed(context);
                    }
                  },
                ),
                SizedBox(height: 4),
                GestureDetector(
                  onTap: () => context.push(Routes.forgotPassword),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot your password',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Image.asset(
                        getIconPath('arrow.png'),
                        fit: BoxFit.cover,
                        width: 30.0,
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isLoading) LoadingIndicator(),
        ],
      ),
    );
  }

   _isValidate() => (_formKey.currentState?.validate());
  // _isValidate() => true;

  void _onpressed(BuildContext context) {
    final email = _controllers[0].text;
    final password = _controllers[1].text;
    setState(() {
      isLoading = true;
    });
    // final email = 'a@gmail.com';
    // final password = '12345678';
    _loginIn(context, email, password);
  }

  _loginIn(BuildContext context, String email, String password) async {
    print('----------------------------------------------------');
    final repo = await ref.read(authRepoProvider.future);
    final result = await repo.login(email, password);
    setState(() {
      isLoading = false;
    });
    switch (result) {
      case Ok():
        {
          showToast(" Welcome ");
          context.go(Routes.mainScreen);
        }
      case Error():
        {
          print(result.error);
        }
    }
    print(result);

    print('----------------------------------------------------');
  }
}
