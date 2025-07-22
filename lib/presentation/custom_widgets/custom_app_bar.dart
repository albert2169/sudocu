import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? left;
  final Widget? title;
  final Widget? right;

  const CustomAppBar({super.key, this.left, this.title, this.right});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: left ?? const SizedBox(),
            ),
            Expanded(child: Center(child: title ?? const SizedBox())),
            SizedBox(
              child: right ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); 
}
