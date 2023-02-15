import 'package:oghala/home.dart';

import 'auth/otpPage.dart';
import 'auth/loginPhone.dart';
import 'auth/loginUser.dart';
import 'app_hive_controller.dart';
import 'api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'middleware.dart';
import 'base/base_variable.dart';
import 'base_widget.dart';
import 'user.dart' as user_model;
import 'user.dart' as user_api;
import 'user.dart';

class UserController2 extends GetxController {
  late TextEditingController mobile;
  late TextEditingController identityController;
  late TextEditingController credentialController;
  Rx<bool> loadingForLogin = false.obs;
  Rx<bool> loadingForOtp = false.obs;
  late user_model.UserModel user;
  late String otpCode = "";

  HiveController<user_model.UserModel> localUser =
      HiveController<user_model.UserModel>(HiveBox.userBox);

  late Rx<String> selectedCountryCode = "+971".obs;

  List<String> prettyCountryCods = [];

  final Map<String, String> countryCods = {
    "+98": "IR", // Iran
    "+971": "AE", // United Arab Emirates
    "+1": "US", // United States
    "+44": "GB", // United Kingdom
    "+33": "FR", // france
    "+61": "AU", // Australia
    "+968": "OM", // Oman
    "+974": "QA", // Qatar
  };

  @override
  void onInit() {
    super.onInit();
    mobile = TextEditingController();
    identityController = TextEditingController();
    credentialController = TextEditingController();
    fetchUser();
  }

  fetchUser() async {
    try {
      List<user_model.UserModel> users = await localUser.readList();
      user = users[0];
    } catch (_) {}
  }

  @override
  void onClose() {
    mobile.dispose();
    super.onClose();
  }

  List<String> getCodesList() {
    return countryCods.keys.toList();
  }

  String? identityValidator(String? value) {
    if (value!.length == 0) {
      return 'enter a valid username';
    }
    return null;
  }

  String? mobileValidator(String? value) {
    if (value!.length < 10) {
      return "";
    }
    return null;
  }

  void login() async {
    try {
      loadingForLogin.value = true;
      final resp = await user_api.User2.sendOtp(
        mobile: "$selectedCountryCode${mobile.text}",
        country: countryCods[selectedCountryCode.value]!,
      );
      loadingForLogin.value = false;
      if (resp != null) {
        Api api = Middleware.resultValidation(resp);
        if (api.result != null) {
          Get.to(otpScreen());
        } else {
          BaseWidget.errorSnackBar(
            api.error!.mobile,
            2,
            SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void loginViaPass() async {
    try {
      loadingForLogin.value = true;
      final resp = await user_api.User2.login(
        identity: "${identityController.text}",
        credential: "${credentialController.text}",
      );
      loadingForLogin.value = false;
      if (resp != null) {
        Api api = Middleware.resultValidation(resp);
        if (api.result!) {
          user = user_model.UserModel.fromJson(api.data!);
          localUser.add(int.parse(user.id!), user);
          identityController.text = "";
          credentialController.text = "";
          update();
          Get.to(homeScreen());
        } else {
          BaseWidget.errorSnackBar(
            api.error!.otp,
            2,
            SnackPosition.BOTTOM,
          );
        }
      } else {
        BaseWidget.errorSnackBar(
          "Internet connection error",
          2,
          SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void verifyOtp() async {
    try {
      loadingForOtp.value = true;
      final resp = await user_api.User2.verifyOtp(
        mobile: "$selectedCountryCode${mobile.text}",
        country: countryCods[selectedCountryCode.value]!,
        otp: otpCode,
      );

      if (resp != null) {
        Api api = Middleware.resultValidation(resp);
        if (api.result!) {
          user = user_model.UserModel.fromJson(api.data!);
          localUser.add(int.parse(user.id!), user);
          // Get.offAll(const BaseScreen());
          Get.to(homeScreen());
        } else {
          BaseWidget.errorSnackBar(
            api.error!.otp,
            2,
            SnackPosition.BOTTOM,
          );
        }
      } else {
        BaseWidget.errorSnackBar(
          "Internet connection error",
          2,
          SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void checkUserLogin() async {
    List<user_model.UserModel> users = await localUser.readList();
    if (users.isNotEmpty) {
      try {
        final resp = await user_api.User.getUserInfo(users[0].accessToken!);
        Api api = Middleware.resultValidation(resp);
        if (api.result!) {
          user = users[0];
          Get.to(homeScreen());
        } else {
          localUser.clear();
          Get.to(loginUsername());
        }
      } catch (_) {
        localUser.clear();
        Get.to(loginUsername());
      }
    } else {
      Get.to(loginUsername());
    }
  }

  void logout() {
    BaseWidget.confirmBottomSheet(
      Variable.stringVar.logout,
      Variable.stringVar.doYouWantLogout,
      confirmOnTap: () async {
        await user_api.User.deleteSession(user.accessToken!);
        localUser.clear();
        Get.to(loginUsername());
      },
      confirmTxt: Variable.stringVar.yes,
      closeTxt: Variable.stringVar.no,
    );
  }
}
