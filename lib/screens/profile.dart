import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:oghala/auth/loginPhone.dart';
import 'package:oghala/usercontrol.dart';

class profileScreen extends StatefulWidget {
  final UserController2 userController = Get.put(UserController2());
   profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image(
              image: AssetImage(
                  'assets/icons/Oops! 404 Error with a broken robot-pana (1).png'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 160,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                userController.logout();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xFFBB2226),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logout',style: TextStyle(
                    fontSize: 20
                  ),),
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.signOut,
                  size: 20,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
