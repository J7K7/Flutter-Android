import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Models/UserModel.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

class UserCardList extends StatelessWidget {
  final UserModel data;
  final Function() onPress;
  const UserCardList({Key? key, required this.data, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSkyLight,
      shadowColor: kPrimaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: solidRoundedBox(12,),
        child: InkWell(
          onTap: onPress,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipOval(
                  child: data.imageWideget,
                ),
              ),
              hSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name : ${data.name!}', style: headingTextStyle3,),
                  vSpace(5),
                  Text('Email : ${data.email!}', ),
                  vSpace(5),
                  Text('DOB :  ${data.dob!}', ),
                  vSpace(5),
                  Text('Mobile No. : ${data.mobileNo!}', ),
                ],
              ),
              vSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
