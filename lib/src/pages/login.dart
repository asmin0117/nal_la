import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/kakao_login_controller.dart';
import 'package:nal_la/values/colors.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({var key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: Scaffold(
  //     appBar: AppBar(
  //       title: Text("login page"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           TextButton(
  //             onPressed: controller.signwithKakao,
  //             child: Image.asset(
  //               "assets/images/button/kakao_login/ko/kakao_login_medium.png",
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   ));
  // }
}


class _LoginState extends State<LoginWidget> {

  KakaoLoginController controller = Get.put(KakaoLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 33,
              top: 137,
              right: 33,
              bottom: 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 196,
                      height: 82,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 12, right: 64),
                      child: Text(
                        "뭐든, 날라줄게",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 68, 68),
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: controller.signwithKakao,
                    child: Image.asset(
                      "assets/images/button/kakao_login/ko/kakao_login_medium.png",
                    ),
                  ),
                  Container(
                    height: 22,
                    margin: EdgeInsets.only(right: 34, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "이미 계정이 있으신가요?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Noto Sans CJK KR",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "기존 계정으로 로그인",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 153, 0),
                              fontFamily: "Noto Sans CJK KR",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 92),
                      child: Text(
                        "내 계정찾기",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 153, 0),
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 44,
              child: Text(
                "국내 최초\n블록체인 기반 \n화물운송 앱",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  height: 1.33333,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
