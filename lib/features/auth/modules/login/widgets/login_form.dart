import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo/core/common_ui/widgets/app_text_field.dart';
import 'package:turbo/features/auth/data/models/login_request_body.dart';
import 'package:turbo/features/auth/modules/common/password_textfield.dart';
import 'package:turbo/features/auth/modules/login/cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: "Enter your email address",
            label: "Email Address",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Invalid Email";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
          PasswordTextfield(controller: passwordController),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(value: true, onChanged: (val) {}),
              const Text("Remember Me"),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                log("here");
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                    LoginRequestBody(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
