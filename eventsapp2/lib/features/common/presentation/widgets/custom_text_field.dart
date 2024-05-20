import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.obscure,
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
