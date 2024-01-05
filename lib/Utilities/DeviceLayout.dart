import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceLayout{
  static int mobileLimit = 600; //640
  static int tabletLimit = 1200;  //1200

  static bool isMobile(BuildContext context) =>
      (isPortrait(context) ? Get.size.shortestSide : Get.width) < mobileLimit;

  static bool isTablet(BuildContext context) =>
      (isPortrait(context) ? Get.size.shortestSide : Get.width) < tabletLimit
          && (isPortrait(context) ? Get.size.shortestSide : Get.width) >= mobileLimit;

  static bool isWeb(BuildContext context) =>
      (isPortrait(context) ? Get.size.shortestSide : Get.width) >= tabletLimit;

  static bool isPortrait(BuildContext context) => MediaQuery.of(context).orientation == Orientation.portrait;
}