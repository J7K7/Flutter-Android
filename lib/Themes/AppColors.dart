import 'package:flutter/material.dart';
import 'package:get/get.dart';



const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kAccentColor = Color(0xFF41A397);

const kBodyColor = Color(0xFF2B3953);
const kBgColor = Color(0xFFE7ECF2);

//  const appBarColor = const Color(0xFF1E273A);
//  const appBarColorLight = const Color(0xFFFFFFFF);

//Text
const kTextColor = Color(0xFFFFFFFF);
const kTextColorLight = Color(0xFF1E1E1E);
const kHeadingTextColor = Color(0xFF6F35A5);

const kHintTextColor = Color(0xFF9C9C9D);

const kButtonActiveColor = Color(0xFFE7ECF2);
const kCategoryColor = Color(0xFFfEF1DE);
const kCategoryIconColor = Color(0xFFFA5D7C);

//const buttonInactiveColor = const Color(0xFF83888E);
//const buttonInactiveColorLight = const Color(0xFF83888E);
const kErrorColor = Color(0xFFB00020);
const kTransparent = Colors.transparent;



const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);
const kGrey = Colors.grey;
const kOrange = Color(0xFFE77829);
const kBlue = Color(0xFF4EA7F7);
const kTeal = Color(0xFF30E7D5);
const kGreen = Color(0xFF22B274);
const kRed = Color(0xFFE53935);
const kYellow = Color(0xFFFFAD03);
const kIndigo = Color(0xFF000A45);
const kPurple = Color(0xFF7D58BB);
const kSkyLight = Color(0xFFD9E8FA);

//Application Status Colors
const kVisaApprovedColor = Color(0xFF53E68E);
const kActiveColor = Color(0xFFFFAD03);
const kDeActiveColor = Color(0xFFFF737B);
const kStatus1  = Color(0xFF008000);
const kStatus2      = Color(0xFFCCFFFF);
const kStatus3        = Color(0xFFFCAEC6);
const kStatus4       = Color(0xFFFF7F00);



Color getOffColor() => Get.isDarkMode ? const Color(0x1FFFFFFF) : const Color(0x1F000000);
Color getOffColorR() => Get.isDarkMode ? const Color(0x1F000000) : const Color(0xFFECECEC);
Color getBodyColor() => Get.isDarkMode ? kBodyColor : kBgColor;
Color getBodyColor1() => Get.isDarkMode ? const Color(0xFF1E273A) : const Color(0xFFFCFCFC);
Color getTextColor() => Get.isDarkMode ? kTextColor : kTextColorLight;
Color getTextColor1() => Get.isDarkMode ? kTextColorLight : kTextColor;

