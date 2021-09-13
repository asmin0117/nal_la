import 'package:flutter/material.dart';

class MyContract extends StatelessWidget {
  const MyContract({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("my계약"),
      ),
    ));
  }
}
