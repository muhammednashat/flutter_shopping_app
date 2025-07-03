import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/custom_text_form_field.dart';

class ChangePersonalInfo extends StatefulWidget {
  const ChangePersonalInfo({super.key});
  @override
  State<ChangePersonalInfo> createState() => _ChangePersonalInfoState();
}

class _ChangePersonalInfoState extends State<ChangePersonalInfo> {
  final List<TextEditingController> controllers = List.generate(
    3,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Personal Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),

            CustomTextFormField(label: "Name", controller: controllers[0]),

            SizedBox(height: 12.0),

            CustomTextFormField(label: "Email", controller: controllers[1]),
            SizedBox(height: 12.0),

            SizedBox(height: 30.0),
            CustomElevatedButton(text: "SAVE", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
