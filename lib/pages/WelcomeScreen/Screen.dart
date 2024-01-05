import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/Buttons.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: Get.width * 0.3,
              height: Get.height * 0.2,
              margin: const EdgeInsets.all(4),
              child: Image.asset('assets/images/main_top.png'),
            ),
            vSpace(12),
            Container(
                alignment: Alignment.center,
                child: const Text("Welcome To UMS", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            vSpace(12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/chat.svg', height: Get.height * 0.45,),
                  vSpace(10),
                  mainButton('LOGIN', onPress: () {}, color: kPrimaryColor),
                  vSpace(10),
                  mainButton('SIGN UP', onPress: () {}, color : kPrimaryColor),
                ],
              ),
            ),
            vSpace(10),
            Container(
              alignment: Alignment.bottomRight,
              width: Get.width * 0.3,
              height: Get.height * 0.2,
              child: Image.asset('assets/images/main_bottom.png'),
            ),

          ],
        ),
      ),
    );
  }
}
