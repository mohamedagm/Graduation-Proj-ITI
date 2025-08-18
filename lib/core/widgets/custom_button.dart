import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.child,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(
          double.infinity,
          MediaQuery.of(context).size.height * 0.06,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
