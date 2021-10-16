import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:nal_la/src/controller/kakao_login_controller.dart';
import 'package:http/http.dart' as http;

class PayUser {
  final String message;
  final String Token;

  PayUser({required this.message, required this.Token});

  factory PayUser.fromJson(Map<String, dynamic> json) {
    return PayUser(
      message: json['message'],
      Token: json['Token'],
    );
  }
}

class DBconnection {
  static DBconnection? _instance;
  final String _host = dotenv.get('SERVER_URL');
  final String _port = dotenv.get('MONGO_PORT');
  final String _dbName = dotenv.get('MONGO_DBName');

  Db? _db;

  static getInstance() {
    if (_instance == null) {
      _instance = DBconnection();
    }
    return _instance;
  }

  _getConnectionString() {
    return "mongodb://$_host:$_port/$_dbName";
  }

  closeConnection() {
    _db!.close();
  }

  Future<Db?> getConnection() async {
    if (_db == null) {
      try {
        _db = Db(_getConnectionString());
        await _db!.open();
      } catch (e) {
        print(e);
      }
    }
    return _db;
  }
}

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  KakaoLoginController kcontroller = Get.put(KakaoLoginController());

  String kakaoRestAPIKey = dotenv.get('KAKAO_REST_API');
  String serverURL = dotenv.get('SERVER_URL');
  String coneURL = dotenv.get('CONE_URL');

  Future<String> getUserCharID(String nickname, String phone) async {
    String url = '$coneURL/Signup';
    var data = {"NickName": nickname, "PhoneNumber": phone};
    var header = {"Content-Type": "application/json"};
    var body = json.encode(data);
    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: body);
    print(response.body);
    return response.body;
  }

  Future<String> postUser(
      String email, String nickname, String phone, String ucid) async {
    String url = '$serverURL/Signup';
    var data = {
      "email": email,
      "name": nickname,
      "phone": phone,
      "account": ucid
    };
    print(email);
    var header = {"Content-Type": "application/json"};
    var body = json.encode(data);
    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: body);
    print(response.body);
    return response.body;
  }

  //요청자 전화번호와, UserCharID 필요
  //= 토큰 결과 parsing 해서 token만 가져오기
  Future<String> getToken(String phone, String ucid) async {
    Map<String, String> param = {"PhoneNumber": phone, "UserCharID": ucid};
    String queryString = Uri(queryParameters: param).query;

    var endpointUrl = '$coneURL/GetToken';
    var requestUrl = endpointUrl + '?' + queryString;

    var header = {"Content-Type": "application/json"};

    http.Response response =
        await http.get(Uri.parse(requestUrl), headers: header);
    if (response.statusCode == 200) {
      var tokenJson = response.body;
      Map<String, dynamic> token = jsonDecode(tokenJson);
      print("token: ${token['Token']}");
      return token['Token'].toString().trim();
    } else {
      throw Exception('토큰 발급 실패');
    }
  }

  Future<String> pointCheck(String token) async {
    String url = '$coneURL/MyABPointCheck';
    var data = {
      "authorization": token,
    };
    print("token in pointCheck: ${token}");
    var header = {"Content-Type": "application/json"};
    var body = json.encode(data);
    await Future.delayed(Duration(seconds: 2));
    http.Response response =
    await http.post(Uri.parse(url), headers: header, body: body);
    print("res body in pointCheck: ${response.body}");
    var list = response.body.toString();
    List<String> content = list.split(":");
    var point = content[1].trim();
    return point;
  }




// Future<User> fetchUser() async {
//   String url = '$coneURL/Signup';
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     final userMap = jsonDecode(response.body);
//     return User.fromJson(userMap);
//   }
//
//   throw Exception('데이터 수신 실패입니다.');
// }

}
