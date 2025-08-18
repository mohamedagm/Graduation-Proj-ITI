import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.leadingWidget, this.title, this.actions});
  final Widget? leadingWidget;
  final List<Widget>? actions;
  final Widget? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(leading: leadingWidget, actions: actions, title: title);
  }
}
