import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/values/values.dart';

class ButtonController extends GetView<ButtonController> {

  String title = '';
  String text = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            title,
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
                  Text(text,
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
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 347,
                height: 60,
                margin: EdgeInsets.only(bottom: 56),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 347,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          border: Border.fromBorderSide(Borders.primaryBorder),
                          borderRadius: Radii.k9pxRadius,
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      child: Text(
                        "확인",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryText,
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
