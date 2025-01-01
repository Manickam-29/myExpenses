import 'package:flutter/material.dart';

Widget commonDividerComp(
    double space, Color color, double thickness) {
  return Padding(
    padding: EdgeInsets.only(left: space, right: space),
    child: Divider(
      color: color,
      thickness: thickness,
    ),
  );
}
