import 'package:flutter/material.dart';

class InputColorDot extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const InputColorDot({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30, 
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}