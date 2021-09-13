import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';

class MyContract extends StatelessWidget {
  MyContract({var key}) : super(key: key);
  AppBarWidget appBarWidget = Get.put(AppBarWidget());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("my계약"),
      ),
    ));
  }
}
