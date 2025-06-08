
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
     this.validator
  });

  final String label;
  final TextEditingController controller;
   String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(label: Text(label)),
        ),
      ),
    );
  }
}
