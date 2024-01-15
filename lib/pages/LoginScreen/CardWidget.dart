import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/Buttons.dart';
import 'package:ums_demo/Themes/UiUtils.dart';
import 'package:ums_demo/pages/LoginScreen/Controller.dart';

class LoginCardWidget extends StatelessWidget {
  LoginCardWidget({Key? key}) : super(key: key);

  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => Form(
            key: _controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.txtEmail,
                  focusNode: _controller.focusNodes[0],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration('Email'),
                  validator: (value) => _controller.isValidEmail(),
                  onFieldSubmitted: (_) => fieldFocusChange(context,
                      _controller.focusNodes[0], _controller.focusNodes[1]),
                ),
                vSpace(10),
                Obx(
                  () => TextFormField(
                    controller: _controller.txtPassword,
                    focusNode: _controller.focusNodes[1],
                    obscureText: _controller.obscureText.value,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: textInputDecoration(
                      'Password',
                      trailing: IconButton(
                        onPressed: _controller.showPassword, // Fix here
                        icon: _controller.obscureText.value
                            ? const Icon(
                                Icons.visibility_off,
                                color: kGrey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: kGrey,
                              ),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Invalid Password!" : null,
                    onFieldSubmitted: (_) => fieldFocusChange(context,
                        _controller.focusNodes[1], _controller.focusNodes[2]),
                  ),
                ),
                vSpace(10),
                _controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : mainButton('Login', onPress: () {
                        hideKeyboard(context);
                        _controller.submitAndLogin();
                      },
                        color: kPrimaryColor,
                        focusNode: _controller.focusNodes[2],
                        minSize: Size(Get.width, 50)),
              ],
            ),
          )),
    );
  }
}
