import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oghala/usercontrol.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final UserController2 userController = Get.put(UserController2());

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        userController.checkUserLogin();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/Logo final-Oghala.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
