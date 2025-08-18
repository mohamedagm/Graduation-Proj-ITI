import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.picon,
    this.sicon,
    this.visible = false,
    this.hintText,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData picon;
  final IconButton? sicon;
  final bool? visible;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: visible!,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(picon),
        suffixIcon: sicon,
      ),
    );
  }
}
