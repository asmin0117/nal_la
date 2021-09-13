import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';

class MyPage extends StatelessWidget {
  MyPage({var key}) : super(key: key);
  AppBarWidget appBarWidget = Get.put(AppBarWidget());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: appBarWidget.appbar('요청목록'),
          body: Center(
            child: Text("my페이지"),
          ),
        ));
  }
}
