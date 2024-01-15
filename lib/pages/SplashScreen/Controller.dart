import 'dart:async';

import 'package:get/get.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Utilities/SharedPreferences.dart';
import 'package:ums_demo/pages/HomeScreen/Screen.dart';
import 'package:ums_demo/pages/WelcomeScreen/Screen.dart';

class SplashController extends GetxController{
  var opacity = 0.2.obs;
  Timer? _timer;
  int _secondsRemaining = 4;

  @override
  void onInit(){
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Update the opacity value every second
      opacity(opacity.value + 0.2);
        _secondsRemaining--;

        // Check if 5 seconds have elapsed, and stop the timer
        if (_secondsRemaining == 0) {
          _timer?.cancel();
        }
    });
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    await SharedPrefs.init(); // Ensure _prefsInstance is initialized

    Future.delayed(const Duration(seconds: 5), () {
      if (SharedPrefs.isContains(LOGINDATA) && SharedPrefs.getBool(ISAUTOLOGIN)) {
        Get.offAll(() => NavigationDrawerShow());
      } else {
        Get.offAll(() => WelcomeScreen());
      }
    });
  }

}