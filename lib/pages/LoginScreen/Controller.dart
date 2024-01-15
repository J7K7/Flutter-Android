import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/ApiService.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Utilities/SharedPreferences.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/pages/HomeScreen/Screen.dart';

class LoginController extends GetxController{
  var obscureText = true.obs;
  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final focusNodes = List.generate(3, (index) => FocusNode());

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  void onInit(){
    txtEmail.text = 'abc@gmail.com';
    txtPassword.text = '123456';
    super.onInit();
  }

  void showPassword(){
    obscureText(!obscureText.value);
    update();
  }

  String? isValidEmail() {
    var ans = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(txtEmail.text.isEmpty){
      return 'Enter Email Address!';
    } else if(ans.hasMatch(txtEmail.text)) {
      return null;
    }
    return 'Enter Valid Email Address!';
  }

  void submitAndLogin(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      Map<String, dynamic> mapParam = {
        'email' : txtEmail.text.trim(),
        'password': txtPassword.text.trim()
      };

      callAPILoginUser(mapParam);

    }
  }

  void callAPILoginUser(Map<String, dynamic> param) {
    isLoading(true);
    ApiService.post(API_LOGIN, param: param, success: (data) async {
      SharedPrefs.setCustomObject(LOGINDATA, data);
      txtEmail.clear();
      txtPassword.clear();
      isLoading(false);
      Get.offAll(() => NavigationDrawerShow());
    }, failed: (data) {
      isLoading(false);
      showGetXBar(APP_NAME, data["msg"]);
      debugPrint(data);
    }, error: (msg) {
      isLoading(false);
      showGetXBar(APP_NAME, 'Provided Email or Password is incorrect.');
      debugPrint(msg);
    },
      addHeader: true,
    );
  }

}

