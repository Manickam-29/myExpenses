import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'common_color.dart';
import 'custom_functions.dart';

Widget totalExpenseTile(String total) {
  return GFListTile(
      color: appColor,
      avatar: GFAvatar(
        child: Icon(
          FontAwesomeIcons.indianRupeeSign,
          color: white,
        ),
      ),
      title: Text('Total',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: white)),
      subTitle: Text('Expenses', style: TextStyle(fontSize: 16, color: white)),
      icon: Row(
        children: [
          Text(
            CustomFunctions().formatToRupees(total),
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: white),
          ),
        ],
      ));
}
