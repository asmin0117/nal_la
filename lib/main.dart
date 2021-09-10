import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/app.dart';
import 'package:nal_la/src/pages/home.dart';
import 'package:nal_la/src/pages/join/name_auth.dart';
import 'package:nal_la/src/pages/join/phone_auth.dart';
import 'package:nal_la/values/colors.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        fontFamily: "Noto Sans CJK KR",
        scaffoldBackgroundColor: AppColors.primaryBackground,
        appBarTheme: AppBarTheme(
          elevation: 0.0
        )
      ),
      home: App(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.fade),
        GetPage(name: "/nameAuth", page: () => NameAuthWidget(), transition: Transition.fade),
      ],
    );
  }
}

