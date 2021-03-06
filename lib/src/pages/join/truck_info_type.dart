import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/appbar_controller.dart';
import 'package:nal_la/values/values.dart';

class TruckType extends StatefulWidget {
  TruckType({var key}) : super(key: key);

  @override
  _TruckTypeState createState() => _TruckTypeState();
}

_buttonOn(String title) {
  return ElevatedButton(
    onPressed: () {
      _buttonOff(title);
    },
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Noto Sans CJK KR",
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 26,
      ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0,
      fixedSize: Size(160, 122),
      primary: AppColors.secondaryElement,
    ),
  );
}

_buttonOff(String title) {
  return OutlinedButton(
    onPressed: () {
      _buttonOn(title);
    },
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Noto Sans CJK KR",
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 26,
      ),
    ),
    style: OutlinedButton.styleFrom(
      elevation: 0,
      fixedSize: Size(160, 122),
      primary: AppColors.secondaryElement,
    ),
  );
}

class _TruckTypeState extends State<TruckType> {
  bool _pressed = true;

  // _button(String title) {
  //   return ElevatedButton(
  //       onPressed: () {},
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //           (Set<MaterialState> states) {
  //             if (states.contains(MaterialState.pressed)) return AppColors.secondaryElement;
  //             return Colors.white;
  //           },
  //         ),
  //       ),
  //       child: Text(title,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontFamily: "Noto Sans CJK KR",
  //             fontWeight: FontWeight.w400,
  //             fontSize: 26,
  //           )));
  // }

  _button(String title) {
    return ElevatedButton(
      onPressed: () {
        _pressed = !_pressed;
        ElevatedButton.styleFrom(
            textStyle: TextStyle(color: Colors.white),
            primary: AppColors.secondaryElement);
      },
      child: Text(title),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryBackground,
        elevation: 0,
        textStyle: TextStyle(
          color: Colors.black,
          fontFamily: "Noto Sans CJK KR",
          fontWeight: FontWeight.w400,
          fontSize: 26,
        ),
      ),
    );
  }

  // ElevatedButton _button(String title) {
  //   return new ElevatedButton(
  //     onPressed: () {
  //       setState(() {
  //         _pressed = !_pressed;
  //       });
  //     },
  //     child: Text(
  //       title,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontFamily: "Noto Sans CJK KR",
  //         fontWeight: FontWeight.w400,
  //         fontSize: 26,
  //       ),
  //     ),
  //     style: ElevatedButton.styleFrom(
  //         fixedSize: Size(160, 122),
  //         primary: _pressed
  //             ? AppColors.primaryBackground
  //             : AppColors.secondaryElement,
  //         textStyle: _pressed
  //             ? TextStyle(
  //                 color: Colors.black,
  //               )
  //             : TextStyle(
  //                 color: Colors.white,
  //               )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    AppBarWidget appBarWidget = Get.put(AppBarWidget());
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget.appbar('????????????'),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 18, top: 20),
                child: Text(
                  "?????? ????????? ???????????????????",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Noto Sans CJK KR",
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            Container(
              //height: 122,
              margin: EdgeInsets.only(left: 23, top: 20, right: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _button("??????"),
                  SizedBox(),
                  _button("??????"),
                  SizedBox(),
                  _button("?????????"),
                ],
              ),
            ),
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
                        "??????",
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
          ],
        ),
      ),
    ));
  }
}
