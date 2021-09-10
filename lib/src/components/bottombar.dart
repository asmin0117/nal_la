import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/bottom_controller.dart';

class BottomNav extends GetView<BottomController> {
  const BottomNav({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.ContractList:
            return ContractList();
            break;
          case RouteName.MyContract:
            return MyContract();
            break;
          case RouteName.Community:
            return Community();
            break;
          case RouteName.Message:
            return Message();
            break;
          case RouteName.MyPage:
            return MyPage();
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.changePageIndex,
          //GetView 사용으로 간편화됨
          items: [
            BottomNavigationBarItem(),
          ],
        ),
      ),
       */
    );
  }
}
