import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/Themes/UiUtils.dart';

class LoginModel{
  String? accessToken;
  String? userType;
  String? name;
  String? isActive;
  String? image;

  LoginModel({
    this.accessToken,
    this.name,
    this.isActive,
    this.image
  });

  LoginModel.fromJson(Map<String, dynamic> data){
    accessToken = data['token'];
    name = data['name'];
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

    data['token'] = accessToken;
    data['name'] = name;
    data['isActive'] = isActive;
    data['image'] = image;

    return data;

  }
}