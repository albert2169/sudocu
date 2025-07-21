import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? left;
  final Widget? title;
  final Widget? right;

  const CustomAppBar({
    super.key,
    this.left,
    this.title,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.only(left:  30, right: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            left ?? const SizedBox(width: 48), 
            Expanded(
              child: Center(
                child: title ?? const SizedBox(),
              ),
            ),
            right ?? const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
