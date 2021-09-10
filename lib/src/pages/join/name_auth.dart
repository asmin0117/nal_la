import 'package:flutter/material.dart';
import 'package:nal_la/values/values.dart';

class NameAuthWidget extends StatefulWidget {
  @override
  _NameAuthState createState() => _NameAuthState();
}

class _NameAuthState extends State<NameAuthWidget> {
  final _formKey = GlobalKey<FormState>();

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
        key: _formKey,
        child: Column(
          children: <Widget>[
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
                    color: AppColors.primaryElement,
                    border: Border.fromBorderSide(Borders.primaryBorder),
                    borderRadius: BorderRadius.all(Radius.circular(0.9)),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '입력해주세요';
                      } else {
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
                      "주민 번호",
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
                    color: AppColors.primaryElement,
                    border: Border.fromBorderSide(Borders.primaryBorder),
                    borderRadius: BorderRadius.all(Radius.circular(0.9)),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '입력해주세요';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '주민 번호',
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
