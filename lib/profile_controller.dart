import 'base/base_variable.dart';
import 'middleware.dart';
import 'api.dart';
import 'profile_model.dart';
import 'app_hive_controller.dart';
import 'user.dart';
import 'base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final HiveController<ProfileModel> _hiveCtl =
      HiveController<ProfileModel>(HiveBox.profileBox);
  Rx<bool> getProfileLoading = false.obs;
  Rx<bool> updateProfileLoading = false.obs;
  Rx<bool> showPassword = false.obs;
  late ProfileModel profile;

  ///TODO : resolve error for profile variable
  void updateTextField({
    required Map<String, TextEditingController> controllers,
  }) {
    for (final key in controllers.keys) {
      switch (key) {
        case 'email':
          controllers[key]!.text = profile.email ?? '';
          break;
        case 'phoneNumber':
          controllers[key]!.text = profile.mobile ?? '';
          break;
        case 'address':
          controllers[key]!.text = profile.address1 ?? '';
          break;
        case 'first name':
          controllers[key]!.text = profile.firstName ?? '';
          break;
        case 'last name':
          controllers[key]!.text = profile.lastName ?? '';
          break;
      }
    }
  }

  void _addProfileToLocal() async {
    final localProfiles = await _hiveCtl.readList();
    ProfileModel localProfile = localProfiles.firstWhere(
        (element) => element.id == profile.id,
        orElse: () => ProfileModel());

    if (localProfile.id == null) {
      await _hiveCtl.add(profile.id!, profile);
    }
  }

  Future<void> getUserProfile() async {
    getProfileLoading.value = true;
    final resp = await User2.getUserProfileApi();
    if (resp != null) {
      Api api = Middleware.resultValidation(resp);
      if (api.result!) {
        profile = ProfileModel.fromJson(api.data!);

        getProfileLoading.value = false;
      } else {
        BaseWidget.errorSnackBar(
          api.error!.email ?? api.error!.mobile,
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

    ///TODO : resolve error for profile variable
    _addProfileToLocal();
  }

  String checkUserPhoneNumberFormat(String phoneNumber) {
    if (phoneNumber.contains('+98')) {
      return phoneNumber.replaceAll('+98', '');
    }
    return phoneNumber;
  }

  void updateUserProfile(Map<String, dynamic> data) async {
    updateProfileLoading.value = true;

    final resp = await User2.updateUserProfileApi(data);

    if (resp != null) {
      Api api = Middleware.resultValidation(resp);
      if (api.result!) {
        final profileApi = ProfileModel.fromJson(api.data!);
        await _hiveCtl.update(
          key: profile.id!,
          obj: profileApi,
          save: profileApi.save,
        );
        profile = profileApi;

        /// for refresh profile screen
        getProfileLoading.value = true;
        getProfileLoading.value = false;

        BaseWidget.successSnackBar(
          Variable.stringVar.successfullyDone,
          2,
          SnackPosition.BOTTOM,
        );
      } else {
        BaseWidget.errorSnackBar(
          api.error!.email ?? api.error!.mobile,
          10,
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
    updateProfileLoading.value = false;
  }
}
