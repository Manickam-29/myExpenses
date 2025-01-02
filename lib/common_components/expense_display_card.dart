import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:myexpenses/common_components/common_color.dart';
import 'package:myexpenses/common_components/custom_functions.dart';
import 'get_screen_size.dart';

class ExpenseDisplayCard extends StatefulWidget {
  final IconData iconData;
  final String mode;
  final String type;
  final String amount;
  final Function() onDeleteAction;

  const ExpenseDisplayCard(
      {super.key,
      required this.iconData,
      required this.mode,
      required this.type,
      required this.amount,
      required this.onDeleteAction});

  @override
  State<ExpenseDisplayCard> createState() => _ExpenseDisplayCardState();
}

class _ExpenseDisplayCardState extends State<ExpenseDisplayCard> {
  @override
  Widget build(BuildContext context) {
    GetScreenSize().getHeight(context);
    GetScreenSize().getWidth(context);
    return GFListTile(
        color: appColor,
        avatar: GFAvatar(
          child: Icon(
            widget.iconData,
            color: white,
          ),
        ),
        title: Text(widget.type,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: white)),
        subTitle:
            Text(widget.mode, style: TextStyle(fontSize: 16, color: white)),
        icon: Row(
          children: [
            Text(
              CustomFunctions().formatToRupees(widget.amount),
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: white),
            ),
            IconButton(
                onPressed: widget.onDeleteAction,
                icon: Icon(
                  Icons.delete,
                  color: white,
                  size: 32,
                )),
          ],
        ));
  }
}
