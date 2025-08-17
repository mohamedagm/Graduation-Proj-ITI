import 'package:flutter/material.dart';

class CustomAppbarLeading extends StatelessWidget {
  const CustomAppbarLeading({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }
}
