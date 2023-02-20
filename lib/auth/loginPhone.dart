import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:oghala/auth/loginUser.dart';
import 'package:oghala/base_widget.dart';
import 'package:oghala/usercontrol.dart';

class loginPhone extends StatelessWidget {
  const loginPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenwidth,
            height: screenheight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight * .10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 140),
                    child: Text(
                      'Log in with \nPhone Number',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF484848),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              Container(
                                width: 316,
                                height: 162,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage('assets/background/Group .png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Form(
                                key: formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _dropDownMenu(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 190,
                                      child: TextFormField(
                                        cursorColor:Color(0xFFBB2226) ,
                                        controller: userController.mobile,
                                        validator: (value) =>
                                            validatephone(value),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black26,
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color:Color(0xFFBB2226),
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 1,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: ' Phone number',
                                          hintText: '912*********',
                                          prefixIcon: Icon(
                                         FontAwesomeIcons.phone,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFBB2226),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.20),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    )
                                  ],
                                ),
                                width: 290,
                                height: 52,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFBB2226),
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      userController.login();
                                    } else {
                                      BaseWidget.errorSnackBar(
                                        'Enter Valid Mobile Number',
                                        2,
                                        SnackPosition.BOTTOM,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(loginUsername());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Log in with Username',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFBB2226),
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      color:Color(0xFFBB2226),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: 336,
                          height: 453,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFEFEFEF),
                            ),
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

UserController2 userController = Get.put(UserController2());
final formKey = GlobalKey<FormState>();
final TextEditingController controller = TextEditingController();


Widget _dropDownMenu() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26)),
    width: 90,
    height: 60,
    child: DropdownButtonHideUnderline(
      child: Obx(
            () {
          return DropdownButton2(
            items: userController
                .getCodesList()
                .map(
                  (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
                .toList(),
            onChanged: (value) {
              userController.selectedCountryCode.value = value.toString();
            },
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            dropdownDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            value: userController.selectedCountryCode.value,
            itemHeight: 40,
            dropdownMaxHeight: 200.0,
          );
        },
      ),
    ),
  );
}

String? validatephone(String? value) {
  if (value == null || value.isEmpty || value.length < 10) {
    return 'enter a valid phone numbber';
  } else {
    return null;
  }
}