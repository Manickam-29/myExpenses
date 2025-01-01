import 'package:flutter/material.dart';
import 'common_color.dart';
import 'get_screen_size.dart';

class CircularElevatedButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final double size;
  final Color color;
  final TextStyle textStyle;

  const CircularElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.size = 60.0, // Default size
    this.color = Colors.blue, // Default color
    this.textStyle = const TextStyle(color: Colors.white), // Default text style
  });

  @override
  Widget build(BuildContext context) {
    double height = GetScreenSize().getHeight(context);
    double width = GetScreenSize().getWidth(context);
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  12)), // No rounded corners, making it a rectangle
            ),
            disabledBackgroundColor: Colors.grey,
            minimumSize: Size(width * 0.8, height * 0.06)),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
