import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ums_demo/AppCommon/CommonFunctions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ums_demo/Themes/AppColors.dart';
import 'package:ums_demo/Themes/UiUtils.dart';
import 'package:ums_demo/Widgets/UserCard.dart';
import 'package:ums_demo/Widgets/UserCardList.dart';
import 'package:ums_demo/pages/HomeScreen/Controller.dart';
import 'package:ums_demo/pages/HomeScreen/NavigationDrawerWidget.dart';

class NavigationDrawerShow extends StatelessWidget {
  NavigationDrawerShow({Key? key}) : super(key: key);
  final drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      style: DrawerStyle.style1,
      menuScreen: NavigationDrawerWidget(),
      mainScreen: HomeScreen(),
      slideWidth: 240,
      borderRadius: 8.0,
      showShadow: true,
      shadowLayer2Color: kWhite,
      mainScreenTapClose: true,
      angle: 0.0,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), titleTextStyle: headingTextStyle1,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.bars),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? spinKitWidgetWave()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpace(10),
                  Expanded(
                    flex: 1,
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (c, i) => hSpace(),
                          itemCount: controller.listOfUsers.length,
                          itemBuilder: (context, index) {
                            var item = controller.listOfUsers[index];
                            return UserCard(
                              data: item,
                              onPress: () {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                  vSpace(10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 30,
                    width: Get.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Expanded(
                           child: Text('User Details', style: headingTextStyle3,textAlign: TextAlign.center),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (c, i) => vSpace(),
                          itemCount: controller.listOfUsers.length,
                          itemBuilder: (context, index) {
                            var item = controller.listOfUsers[index];
                            return UserCardList(
                              data: item,
                              onPress: () {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
