import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/Buttons.dart';

//Bid Stone T&C
class ConditionDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? heading;
  final TextAlign messageAlign;
  final String okText;
  final String? cancelText;
  final Function() okPress;
  final Function()? cancelPress;

  const ConditionDialog({Key? key,
    required this.title,
    required this.message,
    this.heading,
    this.messageAlign = TextAlign.center,
    required this.okText,
    required this.okPress,
    this.cancelText,
    this.cancelPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 20),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(title, style: Get.textTheme.headline5),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4, bottom: 16),
                height: 1,
                color: kGrey,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(message),
              ),
              Container(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(cancelPress != null)
                    outlinedButton(cancelText!, onPress: cancelPress),
                  hSpace(),
                  mainButton(okText, radius: 8, onPress: okPress),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
