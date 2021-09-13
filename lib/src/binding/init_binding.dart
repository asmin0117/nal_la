
import 'package:get/get.dart';
import 'package:nal_la/src/controller/bottom_nav_controller.dart';
import 'package:nal_la/src/controller/kakao_login_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomController());
    Get.put(KakaoLoginController(), permanent: true); //GetService가 아니므로 permanent: true 설정 필요
  }
}