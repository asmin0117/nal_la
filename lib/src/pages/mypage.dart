import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/src/controller/pay_controller.dart';
import 'package:nal_la/src/controller/sign_up_controller.dart';
import 'package:nal_la/values/values.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  SignUpController signUpController = Get.put(SignUpController());
  AppBarWidget appBarWidget = Get.put(AppBarWidget());
  PayController payController = Get.put(PayController());

  String? phone = Get.parameters['phone'];
  String? nickname = Get.parameters['nickname'];
  String? email = Get.parameters['email'];

  late Future<String> token;
  //late Future<String> point;


  @override
  void initState() {
    super.initState();
    token = signUpController.getToken("12", "j6o83fv0788");
    //point = signUpController.pointCheck(token.toString());
  }

  Widget userInfo() {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        padding: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.accentText),
            ),
            color: Colors.white),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 11, top: 8),
              child: Text(
                "안녕하세요, $nickname님!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 11, top: 13),
              child: Text(
                "나의 COCOIN 지갑주소",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: 17,
            margin: EdgeInsets.only(left: 11, top: 9, right: 39),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      "j6o83fv0788",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }

  var f = NumberFormat('###,###,###,###');

  //Future<Widget> pointInfo(String token) async {
  Widget pointInfo(String point) {

    return Container(
        height: MediaQuery.of(context).size.height / 8,
        padding: const EdgeInsets.only(top: 18, left: 30, right: 30),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.accentText,
              ),
            ),
            color: Colors.white),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "총 보유 포인트 :",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${f.format(double.parse(point))}  COCOIN",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "출금 가능 포인트 :",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${f.format(double.parse(point))}  COCOIN",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget pointButtons() {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.accentText,
            ),
          ),
          color: Colors.white),
      child: Row(
        children: [
          Spacer(),
          TextButton(
              onPressed: () {
                payController.goBootpayRequest(
                    context, "kcp", 'card', ['card', 'phone', 'vbank', 'bank']);
              },
              child: Text(
                "포인트 충전",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 153, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text(
                "포인트 송금",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 153, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )),
          Spacer(),
          TextButton(
              onPressed: () {},
              child: Text(
                "입출금 내역",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 153, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget.appbar('My계정'),
      body: Container(
        child: Column(children: [
          userInfo(),
          FutureBuilder<String>(
              future: token,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Text("에러가 있습니다.");
                } else if (snapshot.hasData){
                  print("===========snapshot data: ${snapshot.data.toString()}");
                  return Column(children: [
                    FutureBuilder<String>(
                        future: signUpController.pointCheck(snapshot.data),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("스냅샷 에러");
                          } else if (snapshot.hasData) {
                            print(snapshot.data.toString());
                            return pointInfo(snapshot.data.toString());
                          } else {
                            return Text("대체 무슨 상황");
                          }
                        }),
                  ]);
                } else {
                  return Text("else문");
                }
              }),
          pointButtons(),
        ]),
      ),
    ));
  }
}
