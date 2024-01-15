import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

import 'AppColors.dart';

class AppTheme {
  static ThemeData light = _lightTheme;
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: kBlack,
  scaffoldBackgroundColor: kSkyLight,
  primarySwatch: Colors.teal,
  primaryColor: kPrimaryColor,
  // kPrimaryColorLight: kPrimaryColor1Light,
  cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: kAccentColor,),
  //textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor,),
  hintColor: kHintTextColor,
  appBarTheme: const AppBarTheme(
    elevation: 3,
    centerTitle: true,
    color: kSkyLight,
    titleTextStyle: TextStyle(fontSize: 22, color: kHeadingTextColor, fontWeight: FontWeight.bold,),
    iconTheme: IconThemeData(color: kPrimaryColor,),
    actionsIconTheme: IconThemeData(color: kPrimaryColor,),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(color: kBlack, fontSize: fsXXXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),
    headline2: TextStyle(color: kBlack, fontSize: fsXXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),
    headline3: TextStyle(color: kBlack, fontSize: fsXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),
    headline4: TextStyle(color: kBlack, fontSize: fsLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),
    headline5: TextStyle(color: kBlack, fontSize: fsMedium, fontWeight: FontWeight.bold, letterSpacing: .6,),
    headline6: TextStyle(color: kBlack, fontFamily: fontPoppinsLight, fontSize: fsNormal, fontWeight: FontWeight.w500, letterSpacing: .6,),
  ),

  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(fontSize: textInputTextSize),
    labelStyle: const TextStyle(fontSize: textInputTextSize),
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kGrey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: kRed),
    ),
    //errorBorder: InputBorder.none,
  ),

);