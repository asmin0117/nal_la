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
  String serverURL = dotenv.get('SERVER_URL');

  Future<UserCredential?> signwithKakao() async {
    final clientState = Uuid().v4();

    final authUri = Uri.https("kauth.kakao.com", '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '$kakaoRestAPIKey',
      'response_mode': 'form_post',
      'redirect_uri':
          '$serverURL/callbacks/kakao/sign_in',
      'state': clientState,
    });

    final authResponse = await FlutterWebAuth.authenticate(
        url: authUri.toString(), callbackUrlScheme: "webauthcallback");

    final code = Uri.parse(authResponse).queryParameters;

    final tokenUri = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': '$kakaoRestAPIKey',
      'redirect_uri':
          '$serverURL/callbacks/kakao/sign_in',
      'code': code['code'],
    });
    final tokenResult = await http.post(tokenUri);
    Map<String, dynamic> accessToken = json.decode(tokenResult.body);
    final response = await http.post(Uri.parse('$serverURL/callbacks/kakao/token'), body: {"accessToken": accessToken['access_token']});

    return await FirebaseAuth.instance.signInWithCustomToken(response.body);
  }
}
