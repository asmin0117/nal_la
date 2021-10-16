import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/app.dart';
import 'package:nal_la/src/binding/init_binding.dart';
import 'package:nal_la/src/pages/add_contract.dart';
import 'package:nal_la/src/pages/contract_list.dart';
import 'package:nal_la/src/pages/home.dart';
import 'package:nal_la/src/pages/join/name_auth.dart';
import 'package:nal_la/src/pages/join/phone_auth.dart';
import 'package:nal_la/src/pages/join/truck_info_type.dart';
import 'package:nal_la/src/pages/pay_test.dart';
import 'package:nal_la/src/pages/pay_token.dart';
import 'package:nal_la/values/colors.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        fontFamily: "Noto Sans CJK KR",
        scaffoldBackgroundColor: AppColors.primaryBackground,
        appBarTheme: AppBarTheme(
          elevation: 1
        )
      ),
      home: App(),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.fade),
        GetPage(name: "/nameAuth", page: () => NameAuthWidget(), transition: Transition.fade),
        GetPage(name: "/contractList", page: () => ContractList(), transition: Transition.fade),
        GetPage(name: "/truckType", page: () => TruckType(), transition: Transition.fade),
        GetPage(name: "/add", page: () => AddContractPage(), transition: Transition.leftToRightWithFade),
        GetPage(name: "/test", page: () => DataWidget(), transition: Transition.leftToRightWithFade),
        GetPage(name: "/token", page: () => TokenWidget(), transition: Transition.leftToRightWithFade),
      ],
    );
  }
}

