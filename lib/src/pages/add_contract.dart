import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';

class AddContractPage extends StatelessWidget {
  AddContractPage({var key}) : super(key: key);
  AppBarWidget appBarWidget = Get.put(AppBarWidget());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: appBarWidget.appbar('운송 요청 작성'),
          body: Center(
            child: Text("작성"),
          ),
        ));
  }
}
