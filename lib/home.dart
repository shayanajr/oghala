import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oghala/screens/profile.dart';
import 'package:oghala/screens/questionList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int newindex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [
      questionList(),
      profileScreen(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color:Color(0xFFEEEEEE), width: 10, style: BorderStyle.solid)),
          width: 80,
          height: 80,
          child: FloatingActionButton(
            elevation: 4,
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFFBB2226),
            child: Icon(
              FontAwesomeIcons.plus,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFBB2226),
          onTap: (int index) {
            setState(() {
              newindex = index;
            });
          },
          currentIndex: newindex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidComments), label: 'Questions'),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userLarge,size: 20,), label: 'Profile'),
          ],
        ),
        body: Screens[newindex],
      ),
    );
  }
}
