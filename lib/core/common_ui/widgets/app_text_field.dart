
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? errorText;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.obscureText = false,
    required this.controller,
    this.suffixIcon,
    this.errorText,
     this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
        validator: validator,
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            
            hintText: hintText,
            suffixIcon: suffixIcon,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}