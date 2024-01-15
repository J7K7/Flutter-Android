import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/Models/DrawerItem.dart';
import 'package:ums_demo/Pages/LoginScreen/Screen.dart';
import 'package:ums_demo/Utilities/SharedPreferences.dart';
import 'package:ums_demo/pages/HomeScreen/Screen.dart';

final drawerMenuList = [
  const DrawerItem(title: 'Home', icon: Icons.home),
  const DrawerItem(title: 'Add User', icon: Icons.person_add),
  const DrawerItem(title: 'Logout', icon: Icons.logout),
];

void onPressDrawerItem(int index, int oldIndex) {
  switch (index) {
    case 0:
      Get.offAll(() => NavigationDrawerShow());
      break;
    case 1:
    // Get.to(() => ());
      break;
    case 2:
      SharedPrefs.clearLoginData();
      Get.offAll(() => const LoginScreen());
      break;
    default:
      Get.back();
      break;
  }
}