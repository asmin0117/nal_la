import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("my페이지"),
          ),
        ));
  }
}
