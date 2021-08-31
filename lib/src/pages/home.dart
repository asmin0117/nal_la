import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({var key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
    );
  }
}