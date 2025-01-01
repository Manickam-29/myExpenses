import 'package:flutter/cupertino.dart';

class ImageComp {
  assetsImageByPath(String path, double height, double width) {
    return Image.asset(path, height: height, width: width);
  }
}
