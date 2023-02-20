import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oghala/usercontrol.dart';
import 'package:pinput/pinput.dart';

class otpScreen extends StatefulWidget {
  const otpScreen({Key? key}) : super(key: key);

  @override
  State<otpScreen> createState() => _otpScreenState();
}
final UserController2 userController = Get.put(UserController2());
class _otpScreenState extends State<otpScreen> {
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
                      'Verification \nOTP Code',
                      style: TextStyle(
                        fontSize: 33,
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
                                height: 52,
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
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Pinput(
                                  onChanged: (pin) {
                                    userController.otpCode = pin;
                                  },
                                  length: 6,
                                  defaultPinTheme: PinTheme(
                                    width: 50,
                                    height: 50,
                                    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                                    decoration: BoxDecoration(
                                      border: Border.all(color:Colors.black26),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:  Color(0xFFBB2226),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed:
                                  userController.verifyOtp,
                                  child: Text(
                                    'Verify',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Text(
                                  'didnt recived code? Resend again',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFBB2226),
                                  ),
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
