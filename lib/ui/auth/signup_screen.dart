import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_app_bar.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/ui/core/ui/loading_indecator.dart';
import 'package:shopping_app/utils/result.dart';
import 'package:shopping_app/utils/util.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  var isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Sign Up", () {
        context.canPop();
      }),
      body: Stack(
        children: [
          Column(
            children: [
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
                  ),
                ),
              ),
            ],
          ),

          if (isLoading) LoadingIndicator(),
        ],
      ),
    );
  }

  _isValidate() => (_formKey.currentState?.validate());

  // _isValidate() => true;

  void _onpressed(BuildContext context) {
    setState(() {
      isLoading = true;
    });
    final name = _controllers[0].text;
    final email = _controllers[1].text;
    final password = _controllers[2].text;

    // final name = 'namwg';
    // final email = 'asdff@gmail.com';
    // final password = '123456789';

    request(context, email, password, name);
  }

  void request(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    print('----------------------------------------------------');
    final repo = await ref.read(authRepoProvider.future);
    final result = await repo.register(email, password, name);
    setState(() {
      isLoading = false;
    });
    switch (result) {
      case Ok():
        {
          showToast("Welcome");
          context.go(Routes.mainScreen);
        }
      case Error():
        {
          showToast(result.error.toString());
        }
    }
  }
}
