import 'dart:io';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/item.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:nal_la/src/controller/kakao_login_controller.dart';

class PayController extends GetxController {
  static PayController get to => Get.find();
  KakaoLoginController controller = Get.put(KakaoLoginController());

  void goBootpayRequest(BuildContext context, String pg, String method,
      List<String> methods) async {
    Item item1 = Item();
    item1.itemName = "COCOIN"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.unique = "ITEM_CODE_COCOIN"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격

    List<Item> itemList = [item1];

    Payload payload = Payload();
    String androidId = dotenv.get('PAY_ANDROID');
    String iosId = dotenv.get('PAY_IOS');
    //String applicationId = dotenv.get('PAY_WEB');
    String serverURL = dotenv.get('CONE_URL');

    payload.androidApplicationId = androidId;
    payload.iosApplicationId = iosId;
    payload.applicationId = Platform.isAndroid ? androidId : iosId;

    payload.pg = pg;
    payload.method = method;
    payload.methods = methods;
    payload.name = '포인트 충전';
    payload.price = 1000.0; //정기결제시 0 혹은 주석
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
    payload.params = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    };
//    payload.us

    User user = User();
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    user.phone = "010-4033-4678";
    user.addr = '서울시 동작구 상도로 222';

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterSample';
    extra.quotas = [0, 2, 3];

    BootpayApi.request(
      context,
      payload,
      extra: extra,
      user: user,
      items: itemList,
      onDone: (String? json) {
        print('--- onDone: $json');
      },
      onCancel: (String? json) {
        print('--- onCancel: $json');
      },
      onError: (String? json) {
        print(' --- onError: $json');
      },
    );
  }
}
