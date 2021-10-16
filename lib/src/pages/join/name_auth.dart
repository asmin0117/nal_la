import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/sign_up_controller.dart';
import 'package:nal_la/src/pages/pay_test.dart';
import 'package:nal_la/values/values.dart';

class NameAuthWidget extends StatefulWidget {
  @override
  _NameAuthState createState() => _NameAuthState();
}

class _NameAuthState extends State<NameAuthWidget> {
  final _formKey = GlobalKey<FormState>();
  var phone;
  var nickname;
  String? email = Get.parameters['email'];

  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              }, //다른 곳 탭할 시 키보드 사라지게
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 18, top: 36),
                            child: Text(
                              "이 름",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Noto Sans CJK KR",
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 44,
                          margin: EdgeInsets.only(left: 18, top: 2, right: 18),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackground,
                            border:
                                Border.fromBorderSide(Borders.primaryBorder),
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.9)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '입력해주세요';
                              } else {
                                nickname = value;
                                print(nickname);
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '이 름',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 18, top: 36),
                            child: Text(
                              "휴대전화 번호",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Noto Sans CJK KR",
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 44,
                          margin: EdgeInsets.only(left: 18, top: 2, right: 18),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackground,
                            border:
                                Border.fromBorderSide(Borders.primaryBorder),
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.9)),
                          ),
                          child: TextFormField(
                            //obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '입력해주세요';
                              } else {
                                phone = value;
                                print(phone);
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '휴대전화 번호',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.secondaryElement,
                              minimumSize: const Size(347, 60),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Get.toNamed(
                                  '/test/value?nickname=$nickname&phone=$phone&email=$email');
                            }
                          },
                          child: Text(
                            "확인",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.accentElement,
                              fontFamily: "Noto Sans CJK KR",
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              letterSpacing: 0.6,
                            ),
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
