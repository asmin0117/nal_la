import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/src/pages/login.dart';

class Home extends StatefulWidget {
  Home({var key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppBarWidget appBarWidget = Get.put(AppBarWidget());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //appBar: appBarWidget.appbar(''),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return LoginWidget();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data!.displayName}님 환영합니다."),
                  TextButton(
                    onPressed: FirebaseAuth.instance.signOut,
                    child: Text("로그아웃"),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/nameAuth");
                    },
                    child: Text("폰인증"),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/contractList");
                      },
                      child: Text("요청목록"))
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
