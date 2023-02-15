import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:oghala/auth/loginPhone.dart';
import 'package:oghala/base_widget.dart';
import 'package:oghala/usercontrol.dart';

class loginUsername extends StatefulWidget {
  const loginUsername({Key? key}) : super(key: key);

  @override
  State<loginUsername> createState() => _loginUsernameState();
}

UserController2 userController = Get.put(UserController2());
final formUserKey = GlobalKey<FormState>();
final formPassKey = GlobalKey<FormState>();

class _loginUsernameState extends State<loginUsername> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
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
              physics: BouncingScrollPhysics(),
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
                      'Log in with \nUsername',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF484848),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                                height: 25,
                              ),
                              Container(
                                width: 316,
                                height: 162,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/background/Group .png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 290,
                                    child: Form(
                                      key: formUserKey,
                                      child: TextFormField(
                                        cursorColor:Color(0xFFBB2226) ,
                                        obscureText: false,
                                        controller:
                                            userController.identityController,
                                        validator:
                                            userController.identityValidator,
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
                                              color: Color(0xFFBB2226),
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Color(0xFFBB2226),
                                              width: 1,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: ' Username',
                                          hintText: 'enter your username',
                                          prefixIcon: Icon(
                                           FontAwesomeIcons.userLarge,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 290,
                                    child: Form(
                                      key: formPassKey,
                                      child: TextFormField(
                                        cursorColor:Color(0xFFBB2226) ,
                                        obscureText: true,
                                        controller:
                                            userController.credentialController,
                                        validator:
                                            userController.identityValidator,
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
                                              color: Color(0xFFBB2226),
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Color(0xFFBB2226),
                                              width: 1,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: ' Password',
                                          hintText: 'enter your password',
                                          prefixIcon: Icon(
                                          FontAwesomeIcons.lock,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formUserKey.currentState!.validate() &&
                                        formPassKey.currentState!.validate()) {
                                      userController.loginViaPass();
                                    } else {
                                      BaseWidget.errorSnackBar(
                                        'Enter username & password',
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
                                  Get.to(loginPhone());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Log in with mobile',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFBB2226),
                                      ),
                                    ),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      color: Color(0xFFBB2226),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: 336,
                          height: 490,
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
