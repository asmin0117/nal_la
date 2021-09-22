import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/bottom_nav_controller.dart';
import 'package:nal_la/src/pages/community.dart';
import 'package:nal_la/src/pages/contract_list.dart';
import 'package:nal_la/src/pages/home.dart';
import 'package:nal_la/src/pages/message.dart';
import 'package:nal_la/src/pages/mycontract.dart';
import 'package:nal_la/values/values.dart';

class App extends GetView<BottomController> {
  App({var key}) : super(key: key);

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, double size, String label) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          "assets/icons/${iconName}_off.png",
          width: size,
        ),
        activeIcon: Image.asset(
          "assets/icons/${iconName}_on.png",
          width: size,
        ),
        label: label);
  }

  Widget _bottomNavBarWidget() {
    return Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.secondaryElement,
            onTap: controller.changePageIndex,
            items: [
              _bottomNavigationBarItem("my", 20, "my계약"),
              _bottomNavigationBarItem("list", 24, "요청목록"),
              _bottomNavigationBarItem("community", 32, "커뮤니티"),
              _bottomNavigationBarItem("message", 24, "메세지"),
              _bottomNavigationBarItem("mypage", 22, "my계정"),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Firebase load fail"),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.secondaryElement,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                //bottomNavigationBar: _bottomNavBarWidget(),
                //return Home();
                // return Scaffold(
                body: Obx(() {
                  switch (RouteName.values[controller.currentIndex.value]) {
                    case RouteName.MyContract:
                      return MyContract();
                      break;
                    case RouteName.ContractList:
                      return ContractList();
                      break;
                    case RouteName.Community:
                      return Community();
                      break;
                    case RouteName.Message:
                      return Message();
                      break;
                    case RouteName.MyPage:
                      return Home();
                      break;
                  }
                }),
                bottomNavigationBar: _bottomNavBarWidget()
                // Obx(
                //   () => BottomNavigationBar(
                //     type: BottomNavigationBarType.fixed,
                //     currentIndex: controller.currentIndex.value,
                //     showUnselectedLabels: true,
                //     selectedItemColor: Colors.black,
                //     onTap: controller.changePageIndex,
                //     //GetView 사용으로 간편화됨
                //     items: [
                //       BottomNavigationBarItem(
                //           icon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           activeIcon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           label: "my계약"),
                //       BottomNavigationBarItem(
                //           icon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           activeIcon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           label: "계약요청"),
                //       BottomNavigationBarItem(
                //           icon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           activeIcon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           label: "커뮤니티"),
                //       BottomNavigationBarItem(
                //           icon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           activeIcon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           label: "메세지"),
                //       BottomNavigationBarItem(
                //           icon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           activeIcon: SvgPicture.asset(
                //             "assets/svg/bell.svg",
                //             width: 22,
                //           ),
                //           label: "my페이지"),
                //     ],
                //   ),
                // ),
                );
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.secondaryElement,
            ),
          );
        });
  }
}
