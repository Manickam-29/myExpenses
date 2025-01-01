import 'package:flutter/material.dart';
import 'package:myexpenses/common_components/common_color.dart';
import 'package:myexpenses/common_components/common_divider_comp.dart';
import 'package:myexpenses/common_components/get_screen_size.dart';

Future<int?> commonBottomSheets(
    BuildContext context, List<dynamic> list1, List<dynamic> list2) async {
  double height = GetScreenSize().getHeight(context);
  double width = GetScreenSize().getWidth(context);

  // Capture the returned index
  final selectedIndex = await showModalBottomSheet<int>(
    isDismissible: false,
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.all(16),
      height: height * 0.6,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Payment Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: list1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pop(context, index); // Return the selected index
                  },
                  leading: Icon(
                    list2[index],
                    size: 24,
                    color: appColor,
                  ),
                  title: Text(list1[index]),
                );
              },
              separatorBuilder: (context, index) {
                return commonDividerComp(8, grey, 1);
              },
            ),
          ),
        ],
      ),
    ),
  );

  return selectedIndex; // Return the selected index to the calling code
}
