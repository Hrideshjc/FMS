import 'package:flutter/widgets.dart';

class MediaQueryHelper {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
/*-----------------this is static height----------------*/
  static const SizedBox defaultHeight10 = SizedBox(height: 10);
  static const SizedBox defaultHeight20 = SizedBox(height: 20);
  static const SizedBox defaultHeight30 = SizedBox(height: 30);

  /*-----------------this is static height----------------*/
  static const SizedBox defaultwidth10 = SizedBox(width: 10);
  static const SizedBox defaultwidth20 = SizedBox(width: 20);
  static const SizedBox defaultwidth30 = SizedBox(width: 30);
}