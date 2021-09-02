import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

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
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    final body = Uri.parse(result).queryParameters;
    print("==============body 출력==============");
    print(body);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': '$kakaoRestAPIKey',
      'redirect_url':
          'https://desert-slash-height.glitch.me/callbacks/kakao/sign_in',
      'code': body["code"],
    });
    var response = await http.post(tokenUrl);
    Map<String, dynamic> accessTokenResult = json.decode(response.body);
    var responseCustomToken = await http.post(
        "https://desert-slash-height.glitch.me/callbacks/kakao/token" as Uri,
        body: {"accessToken": accessTokenResult['access_token']});

    print("==============accessTokenResult['access_token']출력==============");
    print(accessTokenResult['access_token']);

    return await FirebaseAuth.instance.signInWithCustomToken(responseCustomToken.body);
  }
}
