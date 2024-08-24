import 'package:flutter/material.dart';

class CircularBtn extends StatelessWidget {
  final IconData iconName;
  final double size;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  const CircularBtn(
      {super.key,
      required this.iconName,
      required this.size,
      required this.color,
      required this.bgColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size + 15,
        height: size + 15,
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Center(
          child: Icon(
            iconName,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
