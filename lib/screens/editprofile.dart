import 'package:oghala/base/base_variable.dart';
import 'package:oghala/main_controller.dart';
import 'package:oghala/profile_controller.dart';
import 'package:oghala/app_text_form_field.dart';
import 'package:oghala/profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileCtl = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();
  late AppTextFormField _firstName;
  late AppTextFormField _lastName;
  late AppTextFormField _email;
  late AppTextFormField _phoneNumber;
  late AppTextFormField _address;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileScreen({Key? key}) : super(key: key) {
    _init();
  }

  void _init() async {
    await profileCtl.getUserProfile();
    _initTextField();

    ///TODO : resolve error for profile variable
    profileCtl.updateTextField(
      controllers: {
        'email': _email.controller!,
        'phoneNumber': _phoneNumber.controller!,
        'address': _address.controller!,
        'first name': _firstName.controller!,
        'last name': _lastName.controller!,
      },
    );
  }

  void _initTextField() {
    _firstName = AppTextFormField(
      label: Variable.stringVar.firstName,
      forceLtr: true,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Icon(Icons.edit_outlined, size: 20),
      ),
      dispose: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Require';
        }
        return null;
      },
    );
    _lastName = AppTextFormField(
      label: Variable.stringVar.lastName,
      forceLtr: true,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Icon(Icons.edit_outlined, size: 20),
      ),
      dispose: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Require';
        }
        return null;
      },
    );
    _email = AppTextFormField(
      label: Variable.stringVar.email,
      forceLtr: true,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Icon(Icons.edit_outlined, size: 20),
      ),
      dispose: false,
      textInputType: TextInputType.emailAddress,
      readOnly: true,
    );
    _phoneNumber = AppTextFormField(
      label: Variable.stringVar.phoneNumber,
      forceLtr: true,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Icon(Icons.edit_outlined, size: 20),
      ),
      readOnly: true,
      dispose: false,
      textInputType: TextInputType.phone,
    );
    _address = AppTextFormField(
      label: Variable.stringVar.address,
      forceLtr: true,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Icon(Icons.edit_outlined, size: 20),
      ),
      dispose: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      key: _scaffoldKey,
      // appBar: AppBarMain(
      //   prefix: GestureDetector(
      //     onTap: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //     child: const Padding(
      //       padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
      //       child: Icon(
      //         Icons.menu,
      //         size: 30,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   searchAble: false,
      //   title: "Profile",
      //   suffix: GestureDetector(
      //     onTap: () {},
      //     child: const Padding(
      //       padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
      //       child: SizedBox(
      //         width: 35,
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Obx(
                  () => !profileCtl.getProfileLoading.value
                  ? Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                  right:
                  (Get.width - (MainController.ratio * 333)) * 0.5,
                  left:
                  (Get.width - (MainController.ratio * 333)) * 0.5,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            // top: MainController.ratio * 173.0,
                            left: MainController.ratio * 10.0,
                            right: MainController.ratio * 10.0,
                          ),
                          width: MainController.ratio * 333,
                          height: MainController.ratio * 685,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(

                              children: [
                                SizedBox(height: 15,),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.back,
                                          color: Colors.grey,
                                          size: 25,
                                        ),
                                        Text(
                                          'Back',
                                          style: TextStyle(fontSize: 20,color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MainController.ratio * 173.0,
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Positioned(
                                        top: 20.0,
                                        child: ProfileImage(
                                          name: profileCtl.profile.name,
                                          // name: profileCtl.profile.name,
                                        ),
                                      ),
                                      Positioned(
                                          top: MainController.ratio *
                                              100.0,
                                          right: MainController.ratio *
                                              85.0,
                                          child: _takePicture()),
                                    ],
                                  ),
                                ),
                                _firstName,
                                SizedBox(
                                    height:
                                    MainController.ratio * 20.0),
                                _lastName,
                                SizedBox(
                                    height:
                                    MainController.ratio * 20.0),
                                _email,
                                SizedBox(
                                    height:
                                    MainController.ratio * 20.0),
                                _phoneNumber,
                                SizedBox(
                                    height:
                                    MainController.ratio * 20.0),
                                _address,
                                SizedBox(
                                    height:
                                    MainController.ratio * 40.0),
                                _confirmButton(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  : Container(
                height: Get.height -
                    (Variable.sizeVar.appBarMainHeight +
                        Variable.sizeVar.bottomBarMainHeight),
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _confirmButton() {
    return Obx(
          () => profileCtl.updateProfileLoading.value
          ? const CupertinoActivityIndicator()
          : TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFBB2226),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 10.0,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            profileCtl.updateUserProfile(
              {
                'first_name': _firstName.controller!.text,
                'last_name': _lastName.controller!.text,
                'address_1': _address.controller!.text,
              },
            );
          }
        },
        child: Text(
          Variable.stringVar.confirm,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  Widget _takePicture() {
    return Container(
      width: MainController.ratio * 44,
      height: MainController.ratio * 44,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: const Icon(
        Icons.camera_alt_rounded,
        color: Colors.grey,
      ),
    );
  }
}