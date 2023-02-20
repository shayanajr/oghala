import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oghala/screens/detailQuestion.dart';
import 'package:oghala/screens/profile.dart';

class questionList extends StatefulWidget {
  const questionList({Key? key}) : super(key: key);

  @override
  State<questionList> createState() => _questionListState();
}

class _questionListState extends State<questionList> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: [
          SizedBox(
            height: screenheight * 0.05,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth * 0.8,
                  height: 80,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10,
                            spreadRadius: -20,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        cursorColor: Color(0xFFBB2226),
                        decoration: InputDecoration(
                          labelText: 'Search For The Question ...',
                          suffixIcon: Icon(
                            CupertinoIcons.search,
                            color: Color(0x90606060),
                            size: 30,
                          ),
                          labelStyle: TextStyle(color: Color(0x90606060)),
                          filled: true,
                          fillColor: Color(0xFFDFDFDF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Get.to(profileScreen());
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      FontAwesomeIcons.userLarge,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 100,
                height: 30,
                child: Row(
                  children: [
                    Text(
                      'see more',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF686868),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      color: Color(0xFF686868),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: double.infinity,
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0x35BB2226),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.microchip,color:Color(0xFF686868) ,size: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'Tech',
                            style: TextStyle(color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.car,color:Color(0xFF686868) ,size: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'Car',
                            style: TextStyle(color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mobileScreenButton,color:Color(0xFF686868) ,size: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'Mobile',
                            style: TextStyle(color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.apple,color:Color(0xFF686868) ,size: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'Apple',
                            style: TextStyle(color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: (){
                Get.to(detailScreen());
              },
              child: Container(
                width: 380,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: 345,
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                               FontAwesomeIcons.userLarge,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rose sanei',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet...',
                                  style: TextStyle(color: Color(0xFFA7A7A7)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'send at 25 jan 2:45 AM',
                                  style: TextStyle(color: Color(0xFFA7A7A7)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Question title',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.star_fill,color: Color(0xFFF1C644),),
                                SizedBox(width: 5,),
                                Text('4.6',style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold,color: Color(
                                    0xFF4F4F4F)
                                ),)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl nisi. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. In egestas erat imperdiet sed euismod nisi porta lorem mollis.',
                        style: TextStyle(color: Color(0xFF868686),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: 110,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFDDDDDE)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(FontAwesomeIcons.thumbsUp,size: 15,color:  Color(0xFF868686),),
                                  ),
                                  SizedBox(width: 5,),
                                  Text('12',style: TextStyle(color:  Color(0xFF868686)),),
                                  VerticalDivider(),
                                  Icon(FontAwesomeIcons.thumbsDown,size: 15,color:  Color(0xFF868686),),
                                  SizedBox(width: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('12',style: TextStyle(color:  Color(0xFF868686)),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.commentDots,color:  Color(0xFF868686) ,size: 20,),
                              SizedBox(width: 5,),
                              Text('32',style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF868686)
                              ),)
                            ],
                          ),
                          SizedBox(width: 20,),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.shareFromSquare,color:  Color(0xFF868686) ,size: 20,),
                              SizedBox(width: 5,),
                              Text('16',style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF868686)
                              ),)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
