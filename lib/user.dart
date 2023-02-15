import 'api.dart';
import 'api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_hive_controller.dart';
import 'package:hive/hive.dart';



class HiveBox {
  static const userBox = 'user_box';
  static const profileBox = 'profile_box';
}


@HiveType(typeId: 0)
class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.identity,
    this.mobile,
    this.status,
    this.roles,
    this.lastLogin,
    this.accessToken,
    this.refreshToken,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? identity;
  @HiveField(4)
  final String? mobile;
  @HiveField(5)
  final String? status;
  @HiveField(6)
  final List<String>? roles;
  @HiveField(7)
  final int? lastLogin;
  @HiveField(8)
  final String? accessToken;
  @HiveField(9)
  final String? refreshToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"].toString(),
    name: json["name"],
    email: json["email"],
    identity: json["identity"],
    mobile: json["mobile"],
    status: json["status"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    lastLogin: json["last_login"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
  );
}
class User {
  static ApiHelper apiHelper = new ApiHelper();

  static Future mobileValidation(name, family, mobile) async {
    try {
      final res = await http.post(
          Uri.parse(apiHelper.apiUri + 'api/tools/user/mobileValidation'),
          body: {
            "first_name": name,
            "last_name": family,
            "identity": mobile,
          });
      Api resp = Api.fromJson(json.decode(res.body));
      return resp;
    } on Exception catch (error) {
      // return ApiSingleObject(code: -1, status: null, data: null);
      // response = "Error in calling api";
    }
  }

  static Future register(name, family, mobile, password) async {
    try {
      final res = await http
          .post(Uri.parse(apiHelper.apiUri + 'api/tools/user/register'), body: {
        "first_name": name,
        "last_name": family,
        "mobile": mobile,
        "credential": password,
      });
      Api resp = Api.fromJson(json.decode(res.body));
      return resp;
    } on Exception catch (error) {
      // return ApiSingleObject(code: -1, status: null, data: null);
      // response = "Error in calling api";
    }
  }
  static Future? verifyOtp({
    required String mobile,
    required String country,
    required String otp,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.verifyOtp),
        body: {
          "mobile": mobile,
          "country": country,
          "otp": otp,
        },
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      return null;
    }
  }

  static Future deleteSession(String token) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + 'user/logout'),
        body: {
          "token": token,
        },
        headers: {'token': token},
      );
      return true;
    } on Exception catch (error) {
      return Api(error: null, result: null, data: null);
    }
  }




  static Future? getUserProfileApi() async {
    HiveController<UserModel> hiveCtl =
    HiveController<UserModel>(HiveBox.userBox);
    final user = await hiveCtl.readList();
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.userProfile),
        headers: {'token': user[0].accessToken!},
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      /// if network exception
      return null;
    }
  }

  static Future? updateUserProfileApi(Map<String, dynamic> profileInfo) async {
    HiveController<UserModel> hiveCtl =
    HiveController<UserModel>(HiveBox.userBox);
    final user = await hiveCtl.readList();

    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.updateUserProfile),
        body: {
          "first_name": profileInfo['first_name'],
          "last_name": profileInfo['last_name'],
          "address_1": profileInfo['address'] ?? '',
        },
        headers: {'token': user[0].accessToken!},
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      /// if network exception
      return null;
    }
  }

  static Future? login({
    required String identity,
    required String credential,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.login),
        body: {
          "credential": credential,
          "identity": identity,
        },
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      return null;
    }
  }
  static getUserInfo(String token) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + 'user/profile'),
        body: {
          "token": "${token}",
        },
        headers: {'token': "${token}"},
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      return Api(error: null, result: null, data: null);
    }
  }
}

class User2 {
  static ApiHelper apiHelper = ApiHelper();

  static Future? sendOtp(
      {required String mobile, required String country}) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.mobile),
        body: {
          "mobile": mobile,
          "country": country,
        },
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      /// if network exception
      return null;
    }
  }

  static Future? login({
    required String identity,
    required String credential,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.login),
        body: {
          "credential": credential,
          "identity": identity,
        },
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      return null;
    }
  }

  static Future? verifyOtp({
    required String mobile,
    required String country,
    required String otp,
  }) async {
    try {
      final res = await http.post(
        Uri.parse(apiHelper.apiUri + apiHelper.verifyOtp),
        body: {
          "mobile": mobile,
          "country": country,
          "otp": otp,
        },
      );
      return json.decode(res.body);
    } on Exception catch (error) {
      return null;
    }
  }


  static editProfile(String token, String field, String parameter) async {
    try {
      final res = await http.post(
          Uri.parse(apiHelper.apiUri + 'api/tools/user/edit'),
          body: {"token": "$token", "$field": "$parameter"});
      return res.body;
    } on Exception catch (error) {
      return Api(error: null, result: null, data: null);
    }
  }

}


class UserAdapter extends TypeAdapter<UserModel> {
  @override
  int get typeId => 0;

  @override
  UserModel read(BinaryReader reader) {
    int numOfFields = reader.readByte();
    Map fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return UserModel(
      id: fields[0],
      name: fields[1],
      email: fields[2],
      identity: fields[3],
      mobile: fields[4],
      status: fields[5],
      roles: fields[6],
      lastLogin: fields[7],
      accessToken: fields[8],
      refreshToken: fields[9],
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.identity)
      ..writeByte(4)
      ..write(obj.mobile)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.roles)
      ..writeByte(7)
      ..write(obj.lastLogin)
      ..writeByte(8)
      ..write(obj.accessToken)
      ..writeByte(9)
      ..write(obj.refreshToken);
  }
}


