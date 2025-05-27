
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(label: Text(label)),
        ),
      ),
    );
  }
}
