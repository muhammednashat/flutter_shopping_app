import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_app_bar.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';
import 'package:shopping_app/ui/core/ui/line_at_bottom.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar((){
        print("fadf.....................");
        context.pop();}),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [Text('Forgot password', style:  Theme.of(context).textTheme.headlineLarge, ) , ]),
            SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
            Text('Please, enter your email address. You will recieve a link to create a new password view email.', style:  Theme.of(context).textTheme.titleSmall, ),
                  SizedBox(height: 12,),
                  CustomTextFormField(
                    label: 'Email',
                    controller: _controllers[0],
                  ),
                  SizedBox(height: 8),
                
                ],
              ),
            ),

           
            SizedBox(height: 32),
            CustomElevatedButton(text: 'SEND', onPressed: () {}),
             SizedBox(height: 4),
        

            LineAtBottom()
          ],
        ),
      ),
    );
  }
}

