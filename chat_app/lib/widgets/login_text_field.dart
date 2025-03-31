import 'package:flutter/material.dart';
import 'package:chat_app/utils/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasAsterisks = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: hasAsterisks,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
      ),
    );
  }
}
