import 'package:get/get.dart';
import 'package:nal_la/src/components/bottombar.dart';

enum RouteName { ContractList, MyContract, Community, Message, MyPage }

class BottomController extends GetxService {
  //앱이 꺼지기 전까지 계속 사용해야 함. GetxService를 상속받는 것이 적절
  static BottomController get to =>
      Get.find(); //<BottomController> 안 써도 찾을 수 있음, 쉽게 찾을 수 있음

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index); //currentIndex = index;의 의미
  }
}
