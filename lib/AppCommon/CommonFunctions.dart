import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:url_launcher/url_launcher_string.dart';

SizedBox vSpace([double space = 8]) => SizedBox(height: space);
SizedBox hSpace([double space = 8]) => SizedBox(width: space);

void showGetXBar(String title, String message) {
  Get.snackbar("", "",
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.black54,
    titleText: Center(
      child: Text(title, style: Get.textTheme.headlineMedium?.copyWith(color: kWhite)),),
    messageText: Center(
      child: Text(message, style: const TextStyle(color: kWhite, fontSize: fsMedium)),),
  );
}

void toastMessage({required String msg}) => Fluttertoast.showToast(
  msg: msg,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 1,
  fontSize: 14.0,
  backgroundColor: kBlack,
);

String assetsImgPng(img) => 'assets/images/$img.png';
String assetsImgJpg(img) => 'assets/images/$img.jpg';
String assetsImgJpeg(img) => 'assets/images/$img.jpeg';
String assetsImgSvg(img) => 'assets/images/$img.svg';


void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

//DateTime related Functions
String getFormattedDate(DateTime dateTime) {
  return DateFormat('dd-MM-yyyy').format(dateTime);
}

String convertDate(String text) {
  return DateFormat("yyyy-MM-dd").format(DateTime.parse(text));
}

String formatDateTime(String format, DateTime dateTime) {
  return DateFormat(format).format(dateTime);
}

String getDateTimeToStringFromTimeStamp(String format, int timeStamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return DateFormat(format).format(date);
}

String formatStringDate(String format, String dateTime) {
  return DateFormat(format).format(DateTime.parse(dateTime));
}

DateTime getDateTimeFromTimeStamp(String format, int timeStamp) {
  return DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
}
//End DateTime related Functions


//Email Validation
bool emailValidation(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regexEmail = RegExp(pattern);
  return !regexEmail.hasMatch(email) ? false : true;
}

bool emailValidationBulk(String text) {
  bool retValue = false;
  text.split(",").forEach((element) {
    if (element.isNotEmpty && element.isEmail) {
      retValue = true;
    }
  });
  return retValue;
}

//Launch Web Page or other App
launchValidURL(String strURL) async {
  await canLaunchUrlString(strURL)
      ? await launchUrlString(strURL, mode: LaunchMode.externalApplication)
      : throw 'Could not launch $strURL';
}


// Future<String> _getPathToDownload() async {
//   return ExtStorage.getExternalStoragePublicDirectory(
//       ExtStorage.DIRECTORY_DOWNLOADS);
// }

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}