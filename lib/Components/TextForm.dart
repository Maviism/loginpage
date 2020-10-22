import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  TextFormCustom(
      {this.label,
      this.controller,
      this.obsecureText,
      this.keyboardType,
      this.validator});
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsecureText;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: _emailController,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
