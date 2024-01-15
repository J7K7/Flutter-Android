import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/ApiService.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Models/LoginModel.dart';
import 'package:ums_demo/Models/UserModel.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Utilities/SharedPreferences.dart';

class HomeController extends GetxController{
  var listOfUsers = List.generate(0, (index) => UserModel(), growable: true).obs;

  var isLoading = false.obs;
  var selectedDrawerIndex = 0.obs;
  var isActive = false.obs;


  var loginData = LoginModel().obs;

  @override
  void onInit(){
    super.onInit();
    loginData(LoginModel.fromJson(SharedPrefs.getCustomObject(LOGINDATA)));
    if(loginData.value.userType == 'user'){
      isActive(true);
    }
    callAPIGetUsers();
  }

  void updateDrawerIndex(i) {
    selectedDrawerIndex.value = i;
    update();
  }

  void callAPIGetUsers(){
    isLoading(true);
    ApiService.get(API_UserList, success: (data) async{
      if (data['users'] != null) {
        data['users'].forEach((v) {
          listOfUsers!.add(UserModel.fromJson(v));
        });
      }

      isLoading(false);
    },failed: (data) {
      isLoading(false);
      showGetXBar(APP_NAME, data["msg"]);
    }, error: (msg) {
      isLoading(false);
      showGetXBar(APP_NAME, msg["msg"]);
    },);
  }

}