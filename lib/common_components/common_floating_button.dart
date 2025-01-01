import 'package:flutter/material.dart';

class CommonFloatingButton extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final Function() onpressed;

  const CommonFloatingButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onpressed,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor, // Background color
      shape: const CircleBorder(), // Circular shape
      child: IconButton(
        icon: Icon(icon), // Icon for the button
        color: iconColor, // Icon color
        onPressed: onpressed,
      ),
    );
  }
}
