import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({var key}) : super(key: key);

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
              onPressed: signwithKakao,
              child: Image.asset(
                "assets/kakao_login/ko/kakao_login_medium_narrow.png",
              ),
            )
          ],
        ),
      ),
    ));
  }
}
