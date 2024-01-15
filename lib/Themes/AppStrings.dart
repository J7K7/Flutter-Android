import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/Themes/AppColors.dart';

const APP_NAME = "UMS";
const PART_NAME = "The Edu Networks";
const APP_ICON = "assets/images/logo.png";
const ANDROIDAPPID = "";
const IOSAPPID = "";

const currencySymbol = '₹';  //£
const dotSymbol = '•';

final genders = ['Gents', 'Ladies'];

/*fonts*/
const fontPoppins = 'Poppins';
const fontPoppinsLight = 'Poppins-Light';
const fontPoppinsMedium = 'Poppins-Medium';
const fontPoppinsSemiBold = 'Poppins-SemiBold';
const fontPoppinsBold = 'Poppins-Bold';

/* font sizes*/
const fsCaption = 10.0;
const fsSmall = 12.0;
const fsNormal = 14.0;
const fsMedium = 16.0;
const fsLarge = 18.0;
const fsXLarge = 20.0;
const fsXXLarge = 24.0;
const fsXXXLarge = 30.0;

const double bottomBarHeight = 40.0;

const cImage = 'https://www.ncertbooks.guru/wp-content/uploads/2022/05/Course-details.png';


/*SharedPreferences Variables*/
const ISAUTOLOGIN                     = "ISAUTOLOGIN";
const LOGINDATA                       = "LOGINDATA";

/*API Related Constant */
const BASEURL                         = "http://192.168.75.70:3000/";
const LIVEURL                         = "";
const IMAGE_PATH                      = "http://192.168.75.70:3000/images/";

const RECORDPERPAGE                   = 50;
const SAVEDSEARCHRECORD               = 500;

//User Related API
const API_USER                        = "Users/";
const API_LOGIN                       = "login";
const API_SIGNIN                      = API_USER + "signIn";
const API_UserList                    = API_USER + "getAll";
const API_FORGOTPASSWORD              = API_USER + "ForgotPassword";
const API_CHANGEPASSWORD              = API_USER + "ChangePassword";
const API_RESETPASSWORD               = API_USER + "ResetPassword";
const API_REGISTERUSER                = API_USER + "Register";
const API_GETUSERDETAILS              = API_USER + "GetUserDetails";
const API_UPDATEPROFILE               = API_USER + "Updateprofile";
const API_UPDATEFCMTOKEN              = API_USER + "UpdateFCMToken";


const API_AGENT                       = "Agent/";
const API_DASHBOARD                   = API_AGENT + "Dashborad";

const API_UNIVERSITY                      = "University/";
const apiGetUniversityList                = "${API_UNIVERSITY}UniversityFilterGet";

const API_COURSE                      = "Courses/";
const apiGetCourseFilters             = "${API_COURSE}CourseFilter";
const apiGetCourseList                = "${API_COURSE}Courses";
const apiGetCourseDetail              = "${API_COURSE}CourseDetail";

const API_APPLICATION                 ="Application/";
const applications                 ="${API_APPLICATION}Post";
const applicationStatus               ="${API_APPLICATION}ApplicationStatus";
const applicationUpdate               ="${API_APPLICATION}ApplicationStatus";

const API_Profile                     ="Agent/Get";


const String apiGeneralErrorMsg = "Unable to connect. Please try again later.";
const String noInternetErrorMsg = "No internet connection. Please check your internet connection and try again.";
//Status code 400, 403, 404, 500, 503
const String apiServerErrorMsg = "Unable to connect. Please try again later.";
//Status code 401
const String apiUnAuthorizeAccessMsg = "Security Token expired. Retry login";
const String connectionTimeOutMsg = "Connection timed out.";



//Messages
const String recordNotFound = 'Record not found.';


//SettingKeys
const String sKey                     = '';

// final searchLinkList = [
//   LinksData(name: 'Applications'),
//   LinksData(name: 'Universities'),
//   LinksData(name: 'Courses'),
// ];
// final studentsLinkList = [LinksData(name: 'Applications')];
// final helpdeskLinkList = [LinksData(name: 'Help Desk')];

class UserRole{
  UserRole._();
  static const OWNER = 1;
  static const STAFF = 2;
  static const CUSTOMER = 3;
}
String getUserRoleText(int userRole) {
  late String text;
  switch (userRole) {
    case UserRole.OWNER: text = 'Admin';break;
    case UserRole.STAFF: text = 'Staff';break;
    case UserRole.CUSTOMER: text = 'Customer';break;
  }
  return text;
}

class DeviceOSType{
  DeviceOSType._();
  static const Web = 1;
  static const Android = 2;
  static const iOS = 3;
}

class DeviceType{
  DeviceType._();
  static const MOBILE = 1;
  static const TABLET = 2;
  static const WEB = 3;
}
int getDeviceType() {
  if(Get.size.shortestSide < 600){
    return DeviceType.MOBILE;
  } if(Get.size.shortestSide < 600) {
    return DeviceType.TABLET;
  } else {
    return DeviceType.WEB;
  }
}

class Gender{
  Gender._();
  static const MALE = 1;
  static const FEMALE = 2;
}
String getGenderText(int gender) {
  late String text;
  switch (gender) {
    case Gender.MALE: text = genders[0];break;
    case Gender.FEMALE: text = genders[1];break;
  }
  return text;
}


class ApplicationStatus{
  ApplicationStatus._();
  static const Applied = 1; //Applied
  static const OfferIssued = 2; //Offer Issued
  static const OfferRejected = 3; //Offer Rejected
  static const VisaGranted = 4;//Visa Granted
  static const VisaRejected = 5;//Visa Rejected
  static const AddYourRestDocuments = 6;//Add Your Rest Documents
  static const RemoveApplication = 7;//Remove Application
  static const NewApplication = 8;//New Application
  static const Cancelled = 9;//Cancelled
  static const AwaitingConfirmation = 10;//Awaiting Confirmation
  static const NotEligible = 11;//Not Eligible
  static const Issued = 12;//CAS/i20 Issued
  static const VisaApplied = 13;//Visa Applied
  static const Enrolled = 14;//Enrolled
  static const Verified = 15;//Verified
  static const UCOLIssued = 16;//UCOL Issued
  static const UCOLRejected = 17;//UCOL Rejected
  static const VisaWithdrawal = 18;//Visa Withdrawal
}


Color applicationStatusColor(int status) {
  if(status == ApplicationStatus.VisaGranted) {
    return kVisaApprovedColor;
  } else if (status == ApplicationStatus.VisaApplied) {
    return kStatus1;
  } else if (status == ApplicationStatus.Verified) {
    return kStatus3;
  } else {
    return kVisaApprovedColor;
  }
}
//
// String applicationStatus(int status){
//   switch(status){
//     case 1:
//       return "Applied";
//     case 2:
//       return "Offer Issued";
//     case 3:
//       return "Offer Rejected";
//     case 4:
//       return "Visa Granted";
//     case 5:
//       return "Visa Rejected";
//     case 6:
//       return "Add Your Rest Documents";
//     case 7:
//       return "Remove Application";
//     case 8:
//       return "New Application";
//     case 9:
//       return "Cancelled";
//     case 10:
//       return "Awaiting Confirmation";
//     case 11:
//       return "Not Eligible";
//     case 12:
//       return "CAS/i20 Issued";
//     case 13:
//       return "Visa Applied";
//     case 14:
//       return "Enrolled";
//     case 15:
//       return "Verified";
//     case 16:
//       return "UCOL Issued";
//     case 17:
//       return "UCOL Rejected";
//     case 18:
//       return "Visa Withdrawal";
//     default:
//       return "";
//   }
// }

class StaffStatus{
  StaffStatus._();
  static const Active = 'Active';
  static const Inactive = 'InActive';
}


Color staffStatusColor(String status) {
  if(status == StaffStatus.Active) {
    return kVisaApprovedColor;
  } else {
    return kErrorColor;
  }
}