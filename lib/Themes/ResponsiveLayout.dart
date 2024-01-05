import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const ResponsiveLayout({Key? key, required this.mobile, required this.tablet, required this.web})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final _size = Get.size;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          print('width: ${_size.width.toInt()} height:${_size.height.toInt()}');
          print('maxWidth: ${constraints.maxWidth.toInt()} maxHeight: ${constraints.maxHeight.toInt()} shortestSide: ${_size.shortestSide.toInt()}');
          print('isMob-${isMobile(context)}, isTab-${isTablet(context)}, isWeb-${isWeb(context)}');
          print('isPortrait:${isPortrait(context)}');

          if(constraints.maxWidth < mobileLimit){
            print('ResponsiveLayout: MOBILE');
            return mobile;
          }
          if((isPortrait(context) ? constraints.maxHeight : constraints.maxWidth) < tabletLimit){
            print('ResponsiveLayout: TABLET');
            return tablet;
          }
            print('ResponsiveLayout: WEB');
            return web;
        });
  }
}
