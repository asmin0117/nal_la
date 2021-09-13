import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({var key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("커뮤니티"),
          ),
        ));
  }
}
