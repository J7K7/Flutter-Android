import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

class LoginModel{
  String? accessToken;
  int? userId;
  String? userName;
  String? name;
  String? email;
  String? mobileNo;
  String? password;
  String? dob;
  String? isActive;
  String? image;

  LoginModel({
    this.accessToken,
    this.userId,
    this.userName,
    this.name,
    this.email,
    this.mobileNo,
    this.password,
    this.dob,
    this.isActive,
    this.image
  });

  LoginModel.fromJson(Map<String, dynamic> data){
    accessToken = data['access_token'];
    userId = data['userId'];
    userName = data['userName'];
    name = data['name'];
    email = data['email'];
    mobileNo = data['mobileNo'];
    password = data['password'];
    dob = data['dob'];
    isActive = data['isActive'];
    image = data['image'];
  }

  get imageWideget => image != null
      ? CachedNetworkImage(
    imageUrl: IMAGE_PATH + image!,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => errorImageWidget1("user1", color : kGrey),
    fit : BoxFit.cover
  ) : errorImageWidget1('user1', color : kGrey);

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};

    data['access_token'] = accessToken;
    data['userId'] = userId;
    data['userName'] = userName;
    data['name'] = name;
    data['email'] = email;
    data['mobileNo'] = mobileNo;
    data['password'] = password;
    data['dob'] = dob;
    data['isActive'] = isActive;
    data['image'] = image;

    return data;

  }



}