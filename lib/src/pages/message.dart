import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("메세지"),
          ),
        ));
  }
}
