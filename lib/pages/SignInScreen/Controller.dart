import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ums_demo/AppCommon/ApiService.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Pages/LoginScreen/Screen.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as dio;

class SignInController extends GetxController {
  var obscureText = true.obs;
  var isLoading = false.obs;
  var imageFilePath = ''.obs;

  final formKey = GlobalKey<FormState>();
  final focusNodes = List.generate(8, (index) => FocusNode());

  final txtName = TextEditingController();
  final txtPassword = TextEditingController();
  final txtEmail = TextEditingController();
  final txtMobileNo = TextEditingController();
  final txtDob = TextEditingController();

  void showPassword() {
    obscureText(!obscureText.value);
    update();
  }

  void selectDate(context) async {
    DateTime? picker = await showDatePicker(
        context: context,
        firstDate: DateTime(1996),
        lastDate: DateTime(2024),
        initialDate: DateTime(2024));
    if(picker != null) {
      txtDob.text = DateFormat('yyyy-MM-dd').format(picker);
    }
    focusNodes[4].requestFocus();
  }

  void getImage() async{
    final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(imageFile != null){
      imageFilePath.value = imageFile.path;
    }
    debugPrint('Image ------- ${imageFilePath.value}');
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

  String? validateMobile() {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
    if (txtMobileNo.text.isEmpty) {
      return 'Enter Mobile Number!';
    }
    else if (!regExp.hasMatch(txtMobileNo.text)) {
      return 'Enter Valid Mobile Number!';
    }
    return null;
  }




  void submitAndSignIn() async{
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      dio.FormData? formData;

      formData = dio.FormData.fromMap({
        'email': txtEmail.text,
        'password': txtPassword.text,
        'mobileNo': txtMobileNo.text,
        'name': txtName.text,
        'image': imageFilePath,
        'dob': txtDob.text,
      });

      if(imageFilePath.value.isNotEmpty) {
        String imageName = path.basename(imageFilePath.value);

        // debugPrint('Image ----------------- $imageName');

        formData.files.add(MapEntry('image', await dio.MultipartFile.fromFile(
            imageFilePath.value, filename: imageName)));

        // debugPrint('Image ---------- Take Time');
      }

      callAPISignInUser(formData);

    }
  }

  void callAPISignInUser(dio.FormData formData){
    isLoading(true);

    ApiService.post(API_SIGNIN, formData: formData, success: (data) async {
      txtEmail.clear();
      txtPassword.clear();
      txtMobileNo.clear();
      txtName.clear();
      txtDob.clear();
      imageFilePath.value = '';
      isLoading(false);
      Get.offAll(() => const LoginScreen());
    }, failed: (data) {
      isLoading(false);
      showGetXBar(APP_NAME, data["msg"]);
      debugPrint(data);
    }, error: (msg) {
      isLoading(false);
      showGetXBar(APP_NAME, 'Provided data is incorrect.');
      debugPrint(msg);
    },
    );
  }

}
