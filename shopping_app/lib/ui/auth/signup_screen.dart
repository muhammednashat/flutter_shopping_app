import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_app_bar.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/ui/core/ui/line_at_bottom.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar((){
        context.canPop();}),
      body: Column(
        children: [
          Row(children: [Text('Sign up', style:  Theme.of(context).textTheme.headlineLarge, ) , ]),
          SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                     CustomTextFormField(
                      label: 'Name',
                      controller: _controllers[0],
                    ),
                    SizedBox(height: 4),
                    CustomTextFormField(
                      label: 'Email',
                      controller: _controllers[1],
                    ),
                    SizedBox(height: 4),
                    CustomTextFormField(
                      label: 'Password',
                      controller: _controllers[2],
                    ),
                      SizedBox(height: 32),
            
            //
            CustomElevatedButton(text: 'SIGN UP', onPressed: () {}),
              SizedBox(height: 4),
            GestureDetector(
              onTap: ()=>context.push(Routes.login),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account',style:  Theme.of(context).textTheme.titleSmall, ) ,
                  SizedBox(height: 3),
                  Image.asset('assets/icons/arrow.png'),
                ],
              ),
            ),
                       
                       LineAtBottom()
                  ],
                ),
              ),
            ),
          ),
      
        
        
      
        ],
      ),
    );
  }
}

