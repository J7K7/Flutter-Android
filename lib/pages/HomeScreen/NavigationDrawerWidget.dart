import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/AppStrings.dart';
import 'package:ums_demo/pages/HomeScreen/Controller.dart';
import 'package:ums_demo/pages/HomeScreen/DrawerItems.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            vSpace(32),
            ListTile(
              title: Text(APP_NAME, style: Get.textTheme.headline2!.copyWith(color: kWhite), textAlign: TextAlign.center),
            ),
            _buildHeader(),
            const Divider(thickness: 3, color: kWhite,),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: drawerMenuList.length,
                separatorBuilder: (_, i) => const SizedBox(),
                itemBuilder: (BuildContext context, int i){
                  return Obx(() => _drawerItems(
                        onPressed: (){
                          _homeController.updateDrawerIndex(i);
                          onPressDrawerItem(i, _homeController.selectedDrawerIndex.value!);
                        },
                        text: drawerMenuList[i].title,
                        icon: drawerMenuList[i].icon,
                        selected: _homeController.selectedDrawerIndex.value == i ? true : false,
                      ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildHeader(){
    return InkWell(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color : kGrey),
              ),
              height: 60,
              width: 60,
              child: ClipOval(
                child: _homeController.loginData.value.imageWideget,
              ),
            ),
            vSpace(12),
            Text(_homeController.loginData.value.name!, style: const TextStyle(fontSize: 14, color: kWhite, letterSpacing: 1)),
            vSpace(),
          ],
        ),
      ),
    );
  }

  Widget _drawerItems({
    required String text,
    required IconData icon,
    required bool selected,
    VoidCallback? onPressed
  }){
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color : (selected) ? kWhite : kWhite,),
            hSpace(10),
            Expanded(
              child: Text(text, style: TextStyle(fontSize: 13, color: (selected) ? kWhite : kWhite,)),
            ),
            if(selected)
              const Icon(Icons.double_arrow, size: 16, color: kWhite,),
          ],
        ),
      ),
    );
  }
}
