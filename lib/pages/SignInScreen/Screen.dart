import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/Buttons.dart';
import 'package:ums_demo/Themes/UiUtils.dart';
import 'package:ums_demo/pages/SignInScreen/Controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    vSpace(40),
                    TextFormField(
                      controller: _controller.txtName,
                      focusNode: _controller.focusNodes[0],
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: textInputDecoration('Name'),
                      validator: (value) =>
                          value!.isEmpty ? "Enter Name!" : null,
                      onFieldSubmitted: (_) => fieldFocusChange(context,
                          _controller.focusNodes[0], _controller.focusNodes[1]),
                    ),
                    vSpace(10),
                    TextFormField(
                      controller: _controller.txtEmail,
                      focusNode: _controller.focusNodes[1],
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: textInputDecoration('Email'),
                      validator: (value) => _controller.isValidEmail(),
                      onFieldSubmitted: (_) => fieldFocusChange(context,
                          _controller.focusNodes[1], _controller.focusNodes[2]),
                    ),
                    vSpace(10),
                    TextFormField(
                      controller: _controller.txtMobileNo,
                      focusNode: _controller.focusNodes[2],
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: textInputDecoration('Mobile No'),
                      validator: (value) => _controller.validateMobile(),
                      onFieldSubmitted: (_) => fieldFocusChange(context,
                          _controller.focusNodes[2], _controller.focusNodes[3]),
                    ),
                    vSpace(10),
                    TextFormField(
                      controller: _controller.txtDob,
                      focusNode: _controller.focusNodes[3],
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      decoration: textInputDecoration(
                        'DOB(YYYY-MM-DD)',
                        trailing: IconButton(
                          onPressed: () {
                            _controller.selectDate(context);
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Enter DOB!" : null,
                      onFieldSubmitted: (_) => fieldFocusChange(context,
                          _controller.focusNodes[3], _controller.focusNodes[4]),
                    ),
                    vSpace(10),
                    Obx(
                      () => TextFormField(
                        controller: _controller.txtPassword,
                        focusNode: _controller.focusNodes[4],
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: textInputDecoration('Password',
                            trailing: IconButton(
                                onPressed: _controller.showPassword,
                                icon: _controller.obscureText!.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility))),
                        obscureText: _controller.obscureText.value,
                        validator: (value) =>
                            value!.isEmpty ? "Enter Password!" : null,
                        onFieldSubmitted: (_) => fieldFocusChange(
                            context,
                            _controller.focusNodes[4],
                            _controller.focusNodes[5]),
                      ),
                    ),
                    vSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textButton('Profile Image',
                            onPress: _controller.getImage,
                            focusNode: _controller.focusNodes[5]),
                        _controller.imageFilePath!.isNotEmpty
                            ? SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipOval(
                                  child: Image.file(
                                      File(_controller.imageFilePath!.value),
                                      fit: BoxFit.cover),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    vSpace(10),
                    _controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : mainButton('Sign Up',
                            onPress: _controller.submitAndSignIn,
                            focusNode: _controller.focusNodes[6],
                            color: kPrimaryColor,
                            minSize: Size(Get.width, 50)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
