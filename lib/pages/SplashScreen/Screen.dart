import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/UiUtils.dart';
import 'package:ums_demo/pages/SplashScreen/Controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Opacity(
              opacity: _controller.opacity.value,
              child: const Text(
                'UMS',
                style: headingTextStyle1,
              )),),
          vSpace(10),
          const Text(
            'User Management System',
            style: headingTextStyle2,
          ),
          vSpace(10),
          spinKitWidgetWaveSpinner(),
        ],
      ),
    );
  }
}
