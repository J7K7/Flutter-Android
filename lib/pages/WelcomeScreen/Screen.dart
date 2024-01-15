import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Pages/LoginScreen/Screen.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/Buttons.dart';
import 'package:ums_demo/pages/SignInScreen/Screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: Get.width * 0.3,
            height: Get.height * 0.2,
            margin: const EdgeInsets.all(4),
            child: Image.asset('assets/images/main_top.png', fit: BoxFit.fill),
          ),
          vSpace(12),
          Container(
              alignment: Alignment.center,
              child: const Text("Welcome To UMS", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          vSpace(12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/chat.svg', height: Get.height * 0.40, fit: BoxFit.fill),
                  vSpace(10),
                  mainButton('LOGIN', onPress: () {
                      Get.to(() => const LoginScreen());
                    }, color: kPrimaryColor,
                  ),
                  vSpace(10),
                  mainButton('SIGN UP', onPress: () {
                    Get.to(() => SignInScreen());
                  }, color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
          vSpace(10),
          Container(
            alignment: Alignment.bottomLeft,
            width: Get.width * 0.3,
            height: Get.height * 0.15,
            child: Image.asset('assets/images/main_bottom.png', fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
