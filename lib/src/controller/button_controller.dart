import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/values/values.dart';

class ButtonController extends GetView<ButtonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            '본인 인증',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        body: Form(
          child: Column(children: <Widget>[
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: AppColors.accentElement,
                border: Border.fromBorderSide(Borders.secondaryBorder),
              ),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text("본인 인증을 위해\n필요해요.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Noto Sans CJK KR",
                        fontWeight: FontWeight.w400,
                        fontSize: 26,
                        height: 1.73077,
                      )),
                ],
              ),
            ),
            SizedBox(height: 5),
          ]),
        ));
  }
}
