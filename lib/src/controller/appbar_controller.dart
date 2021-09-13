import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/values/values.dart';

class AppBarWidget extends GetxService {

  String title = '';

  PreferredSizeWidget appbar(String title) {
    return AppBar(

      title: Text(
        this.title = title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/bell.png",
              width: 22,
            ))
      ],
    );
  }
}
