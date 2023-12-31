import 'package:flutter/material.dart';
import 'package:homely_dish/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obscureText,
      required this.prefixIcon});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // borderRadius: BorderRadius.circular(100),
      color: Color(kDarkGreen.value).withOpacity(0.1),

      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixIconColor: Color(kLightBlue.value),
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(kDarkGrey.value),
            fontWeight: FontWeight.w500,
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.lightGreen, width: 0.5),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Color(0xFFD32F2F), width: 1.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.5),
          ),
        ),
        controller: controller,
        // cursorHeight: 25,
        style: TextStyle(
          fontSize: 16,
          color: Color(kLightBlue.value),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
