import 'package:flutter/widgets.dart';

class GetScreenSize {
  //Get screen height
  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //Get screen width
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
