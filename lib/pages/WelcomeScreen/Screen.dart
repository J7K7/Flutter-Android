import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              // width: Get.width / 4,
              // height: Get.height / 6,
              margin: const EdgeInsets.all(4),
              child: Image.asset('assets/images/main_top.png'),
            ),
          ],
        ),
      ),
    );
  }
}
