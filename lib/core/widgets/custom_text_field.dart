import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.picon,
    this.sicon,
    this.visible = false,
    this.hintText,
    this.enabled,
    this.onSaved,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? picon;
  final IconButton? sicon;
  final bool? visible;
  final String? hintText;
  final bool? enabled;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      enabled: enabled,
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
