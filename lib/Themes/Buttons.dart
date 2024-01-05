import 'package:flutter/material.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

import 'AppColors.dart';

Widget mainButton(String text, {Color color = kAccentColor, Color textColor = kWhite,
  required Function()? onPress, double radius = 10, double elevation = 0.0, FocusNode? focusNode,
  FontWeight fontWeight = FontWeight.w500, Size minSize = const Size(70, textButtonHeight)})
=> ElevatedButton(
  onPressed: onPress,
  focusNode: focusNode,
  style: ElevatedButton.styleFrom(
    minimumSize: minSize,
    elevation: elevation,
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
  ),
  child: Center(
    child: Text(text, textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: textColor, fontWeight: fontWeight),
    ),
  ),
);


Widget outlinedButton(String text, {Color color = kPrimaryColor,
  required Function()? onPress, FocusNode? focusNode, Size minSize = const Size(120, mainButtonHeight)})
=> OutlinedButton(
  onPressed: onPress,
  focusNode: focusNode,
  style: OutlinedButton.styleFrom(
    minimumSize: minSize,
    side: BorderSide(color: color),
  ),
  child: Text(text, style: TextStyle(color: color),),
);

Widget textButton(String text, {Color textColor = kAccentColor, double textSize = 16,
  double radius = 8.0, FontWeight fontWeight = FontWeight.w500,
  required Function()? onPress, FocusNode? focusNode, Size minSize = const Size(120, textButtonHeight)})
=> TextButton(
  onPressed: onPress,
  focusNode: focusNode,
  style: TextButton.styleFrom(
    minimumSize: minSize,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
  ),
  child: Text(
    text,
    style: TextStyle(color: textColor, fontSize: 14),
  ),
);

Widget iconButton(IconData icon,
    {Color color = kGrey, double size = 24.0, required String tooltip, required Function()? onPress})
=> Tooltip(
  message: tooltip,
  child:   InkResponse(
    onTap: onPress,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Icon(icon, color: color, size: size,),
    ),
  ),
);

Widget bottomButton(String text, {Color color = Colors.transparent, Color textColor = kBlack,
  required Function()? onPress, FocusNode? focusNode,})
=> TextButton(
  onPressed: onPress,
  focusNode: focusNode,
  style: TextButton.styleFrom(
    backgroundColor: color,
    minimumSize: const Size.fromHeight(50.0),
  ),
  child: Text(
    text,
    style: TextStyle(color: textColor, fontSize: 13),
  ),
);
