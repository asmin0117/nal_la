import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/pages/login.dart';

class Home extends StatelessWidget {
  const Home({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
