import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var obscureText = true.obs;
  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final focusNodes = List.generate(3, (index) => FocusNode());

  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  void onInit(){
    txtUsername.text = 'abc';
    txtPassword.text = '123456';
    super.onInit();
  }

  void showPassword(){
    obscureText(!obscureText.value);
    update();
  }

}

