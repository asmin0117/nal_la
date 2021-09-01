import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class KakaoLoginController extends GetxController {
  static KakaoLoginController get to => Get.find();

  String kakaoRestAPIKey = dotenv.get('KAKAO_REST_API');

  Future<UserCredential?> signwithKakao() async {
    final clientState = Uuid().v4();

    final url = Uri.https("kauth.kakao.com", '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '$kakaoRestAPIKey',
      'response_mode': 'form_post',
      'redirect_url':
          'https://desert-slash-height.glitch.me/callbacks/kakao/sign_in',
      'scope': 'account_email profile',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    final body = Uri.parse(result).queryParameters;
    print("==============body[code]출력==============");
    print(body["code"]);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
    });
  }
}
