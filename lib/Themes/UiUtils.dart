import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Themes/Buttons.dart';

// App Dimens //
const double mainButtonHeight = 42;
const double textButtonHeight = 36;
const double outlineButtonHeight = 32;
const double textInputTextSize = 14;
const double filterBarHeight = 40;

// Text Styles //
const TextStyle headingTextStyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w600);
const TextStyle headingTextStyle1 = TextStyle(fontSize: 22, color: kHeadingTextColor, fontWeight: FontWeight.bold);
const TextStyle headingTextStyle3 = TextStyle(fontSize: 20,);
const TextStyle headingTextStyle2 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
const TextStyle simpleTextStyle = TextStyle(fontSize: 16);
const TextStyle simpleTextStyle1 = TextStyle(fontWeight: FontWeight.w500);


Widget nullRecordWidget({String text = recordNotFound}) => Center(child: Text(text, style: const TextStyle(color: Colors.black54, fontSize: 16)));
Widget nullRecordWidgetWithButton({String text = recordNotFound, String buttonText = 'Retry', Function()? onPress}) => Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54, fontSize: 16)),
      vSpace(),
      SizedBox(width: 120, child: mainButton(buttonText, onPress: onPress)),
    ],
  ),
);

Widget titleWidget(String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontSize: 22, color: kHeadingTextColor, fontWeight: FontWeight.bold),
    ),
  );
}

// Input Text Styles //
InputDecoration textInputDecoration(String hint, {Widget? trailing}) =>
    InputDecoration(hintText: hint, labelText: hint, suffixIcon: trailing,);

BoxDecoration solidRoundedBox(double radius, {Color color = Colors.transparent}) =>
    BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius));

BoxDecoration inputRoundedBox() => BoxDecoration(color: getOffColorR(), borderRadius: BorderRadius.circular(20));


Widget spinKitWidget({double size = 40}) => Center(child: SpinKitWave(color: kAccentColor, size: size,));
Image errorImageWidget({String image = 'error_img', double height = 32, double width = 32, Color color = kGrey}) => Image.asset(
  assetsImgPng(image),
  height: height,
  width: width,
  color: color,
  fit: BoxFit.cover,
);

Image errorImageWidget1(String image, {double height = 50, double width = 50, Color color = kGrey}) => Image.asset(
  assetsImgPng(image), height: height, width: width, color: color, fit: BoxFit.contain,
);

String formatDateDisplay(DateTime date){
  return DateFormat("dd-MM-yyyy").format(date);
}