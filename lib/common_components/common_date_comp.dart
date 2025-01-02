import 'package:flutter/material.dart';
import 'package:myexpenses/common_components/common_color.dart';

class CommonDateComp extends StatefulWidget {
  final Function() leftAction;
  final IconData leftIcon;
  final String date;
  final Function() dateAction;
  final Function() rightAction;
  final IconData rightIcon;

  const CommonDateComp(
      {super.key,
      required this.leftAction,
      required this.leftIcon,
      required this.date,
      required this.dateAction,
      required this.rightAction,
      required this.rightIcon});

  @override
  State<CommonDateComp> createState() => _CommonDateCompState();
}

class _CommonDateCompState extends State<CommonDateComp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: widget.leftAction,
            icon: Icon(
              widget.leftIcon,
              color: black,
              size: 24,
            )),
        TextButton(
            onPressed: widget.dateAction,
            child: Text(
              widget.date,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: appColor, fontSize: 24),
            )),
        IconButton(
            onPressed: widget.rightAction,
            icon: Icon(
              widget.rightIcon,
              color: black,
              size: 24,
            ))
      ],
    );
  }
}
