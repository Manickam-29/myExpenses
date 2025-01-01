import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myexpenses/common_components/common_color.dart';

import 'get_screen_size.dart';

class CommonHeader extends StatefulWidget {
  final bool needBackIcon;
  final IconData? backIcon;
  final Function()? backAction;
  final String headerText;

  const CommonHeader(
      {super.key,
      this.needBackIcon = false,
      this.backIcon,
      this.backAction,
      required this.headerText});

  @override
  State<CommonHeader> createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    double height = GetScreenSize().getHeight(context);
    double width = GetScreenSize().getWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Centering the row contents
      children: [
        IconButton(
          onPressed: widget.backAction,
          icon: Icon(
            widget.backIcon,
            color: black, // Define the color of the icon
          ),
        ),
        SizedBox(
          width: width * 0.2,
        ),
        Text(
          widget.headerText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: appColor, // Define the text color
            fontSize: 24, // Set font size
          ),
        ),
      ],
    );
  }
}
