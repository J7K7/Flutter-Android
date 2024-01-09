import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/UiUtils.dart';
import 'package:get/get.dart';
import 'package:ums_demo/pages/LoginPage/CardWidget.dart';
import 'Controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        body: Column(
          children: [
            vSpace(60),
            Container(
              alignment: Alignment.center,
              child: const Text('Login', style: headingTextStyle1, textAlign: TextAlign.center),
            ),
            vSpace(22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset('assets/icons/login.svg', height: Get.height * 0.45, fit: BoxFit.contain),
            ),
            vSpace(12),
            LoginCardWidget(),
            vSpace(13),
            Container(
              alignment: Alignment.bottomRight,
              height: Get.height * 0.16,
              child: Image.asset('assets/images/login_bottom.png', fit: BoxFit.scaleDown),
            ),
          ],
        ),
      ),
    );
  }
}
