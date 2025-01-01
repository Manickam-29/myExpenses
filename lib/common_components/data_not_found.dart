import 'package:flutter/material.dart';
import 'get_screen_size.dart';
import 'image_comp.dart';

@immutable
class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    double height = GetScreenSize().getHeight(context);
    double width = GetScreenSize().getWidth(context);
    return Center(
      child: ImageComp()
          .assetsImageByPath('lib/images/emptyData.gif', height * 0.8, width),
    );
  }
}
