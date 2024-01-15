import 'package:flutter/material.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Models/UserModel.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

class UserCard extends StatelessWidget {
  final UserModel data;
  final Function() onPress;
  const UserCard({Key? key, required this.data, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSkyLight,
      shadowColor: kPrimaryColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: solidRoundedBox(12,),
        child: InkWell(
          onTap: onPress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: ClipOval(
                  child: data.imageWideget,
                ),
              ),
              vSpace(10),
              Row(
                  children: [
                    Text('Name : ${data.name!}', style: headingTextStyle3,)
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
