import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/kakao_login_controller.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({var key}) : super(key: key);
  KakaoLoginController controller = Get.put(KakaoLoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("login page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: controller.signwithKakao,
              child: Image.asset(
                "assets/kakao_login/ko/kakao_login_medium.png",
              ),
            )
          ],
        ),
      ),
    ));
  }
}
