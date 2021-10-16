// import 'dart:io';
//
// import 'package:flutter/material.dart';
//

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get/get.dart';
// import 'package:nal_la/src/controller/appbar_controller.dart';
//
// class TestPage extends StatefulWidget {
//   @override
//   TestPageState createState() => TestPageState();
// }
//
// class TestPageState extends State<TestPage> {
// //  String _platformVersion = 'Unknown';
//   AppBarWidget appBarWidget = Get.put(AppBarWidget());
//
//   @override
//   void initState() {
//     super.initState();
// //    initPlatformState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: appBarWidget.appbar('결제 요청'),
//             body: Container(
//               child: ElevatedButton(
//                 onPressed: () {
//                   goBootpayRequest(context);
//                 },
//                 child: Text("부트페이 결제요청"),
//               ),
//             )));
//   }
//
//   static Future<void> request(BuildContext context, Payload payload,
//       {User? user,
//       List<Item>? items,
//       Extra? extra,
//       StringCallback? onDone,
//       StringCallback? onReady,
//       StringCallback? onCancel,
//       StringCallback? onError}) async {
//
//     String coneURL = dotenv.get('CONE_URL');
//     String androidKey = dotenv.get('PAY_ANDROID');
//     String iosKey = dotenv.get('PAY_IOS');
//
//
//     payload.androidApplicationId = androidKey;
//     payload.iosApplicationId = iosKey;
//     payload.applicationId = Platform.isAndroid
//         ? payload.androidApplicationId
//         : payload.iosApplicationId;
//
//     if (user == null) user = User();
//     if (items == null) items = [];
//     if (extra == null) extra = Extra();
//
//     Map<String, dynamic> params = {
//       "payload": payload.toJson(),
//       "user": user.toJson(),
//       "items": items.map((e) => e.toJson()).toList(),
//       "extra": extra.toJson()
//     };
//
//     // Map<dynamic, dynamic> result = await _channel.invokeMethod(
//     //   "bootpayRequest",
//     //   params,
//     // );
//
//     // String method = result["method"];
//
//   }
//
//   void goBootpayRequest(BuildContext context) async {
//     Payload payload = Payload();
//     payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
//     payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';
//
//     payload.pg = 'kcp';
//     payload.method = 'payco';
// //  payload.methods = ['card', 'phone', 'vbank', 'bank'];
//     payload.name = 'testUser';
//     payload.price = 2000.0;
//     payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
// //    payload.params = {
// //      "callbackParam1" : "value12",
// //      "callbackParam2" : "value34",
// //      "callbackParam3" : "value56",
// //      "callbackParam4" : "value78",
// //    };
//
//     User user = User();
//     user.username = "사용자 이름";
//     user.email = "user1234@gmail.com";
//     user.area = "서울";
//     user.phone = "010-1234-4567";
//
//     Extra extra = Extra();
//     extra.appScheme = 'bootpaySample';
//
//     Item item1 = Item();
//     item1.itemName = "미키's 마우스"; // 주문정보에 담길 상품명
//     item1.qty = 1; // 해당 상품의 주문 수량
//     item1.unique = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
//     item1.price = 1000; // 상품의 가격
//
//     Item item2 = Item();
//     item2.itemName = "키보드"; // 주문정보에 담길 상품명
//     item2.qty = 1; // 해당 상품의 주문 수량
//     item2.unique = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
//     item2.price = 1000; // 상품의 가격
//     List<Item> itemList = [item1, item2];
//
//     BootpayApi.request(
//       context,
//       payload,
//       extra: extra,
//       user: user,
//       items: itemList,
//       onDone: (String? json) {
//         print('onDone: $json');
//       },
//       onReady: (String? json) {
//         //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
//         print('onReady: $json');
//       },
//       onCancel: (String? json) {
//         print('onCancel: $json');
//       },
//       onError: (String? json) {
//         print('onError: $json');
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/sign_up_controller.dart';

class DataWidget extends StatefulWidget {
  @override
  DataWidgetState createState() => DataWidgetState();
}

class DataWidgetState extends State<DataWidget> {
  SignUpController controller = Get.put(SignUpController());

  String? phone = Get.parameters['phone'];
  String? nickname = Get.parameters['nickname'];
  String? email = Get.parameters['email'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'UserCharID 체크',
              style: TextStyle(fontSize: 20),
            ),
            FutureBuilder(
                future: controller.getUserCharID(nickname!, phone!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    String list = snapshot.data.toString();
                    String ucid = '';
                    if (list.contains(":")) {
                      List<String> list1 = list.split(":");
                      print(list1);
                      ucid = list1[1].trim();
                      print(ucid);
                    } else {
                      List<String> list1 = list.split("=");
                      print(list1);
                      ucid = list1[1].trim();
                      print(ucid);
                    }
                    controller.postUser(email!, nickname!, phone!, ucid);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
