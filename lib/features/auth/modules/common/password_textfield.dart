import 'package:flutter/material.dart';
import 'package:turbo/core/common_ui/widgets/app_text_field.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: "Enter your password",
      label: "Password",
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      validator: (value) {
        if (value==null||value.isEmpty) {
          return "Invalid password";
        }else{
          return null;
        }
      },
      suffixIcon: IconButton(
        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
    );
  }
}
