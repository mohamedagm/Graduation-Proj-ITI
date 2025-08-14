import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.icon,
    this.onPressedBag,
    this.title,
  });
  final Widget icon;
  final void Function()? onPressedBag;
  final Widget? title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //بتتعمل تلقائي سبحااانه ايام ال اب بار بتاع زمان الاوتوماتك
      // leading: Padding(
      //   padding: const EdgeInsets.only(left: 16.0),
      //   child: IconButton(
      //     style: IconButton.styleFrom(backgroundColor: Colors.white),
      //     onPressed: onPressed,
      //     icon: icon,
      //   ),
      // ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: onPressedBag,
            icon: Icon(Icons.local_mall, color: Colors.blueAccent),
          ),
        ),
      ],
      centerTitle: true,
      title: title,
    );
  }
}
