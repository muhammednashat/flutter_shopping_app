
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    this.readOnly = false,
    required this.label,
    required this.controller,
     this.validator
  });

  final bool readOnly;
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
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(label: Text(label)),
        ),
      ),
    );
  }
}
