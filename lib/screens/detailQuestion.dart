import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.back,
                            size: 25,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Question Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 25,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 230,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/Logo final-Oghala.png'))),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question title',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                          Icon(FontAwesomeIcons.microchip,color:Color(0xFF686868) ,size: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'Tech',
                            style: TextStyle(color: Color(0xFF686868)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 345,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      FontAwesomeIcons.userLarge,
                      size: 25,
                      color: Colors.white,

                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shayan ajorloo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(
                            0xFFA7A7A7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'send at 25 jan 2:45 AM',
                        style: TextStyle(color: Color(0xFFA7A7A7)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Color(0xFFF1C644),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.6',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4F4F4F)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl nisi. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. In egestas erat imperdiet sed euismod nisi porta lorem mollis.Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. In egestas erat imperdiet sed euismod nisi porta lorem mollis.Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. In egestas erat imperdiet sed euismod nisi porta lorem mollis.',
                textAlign: TextAlign.justify,
              ),
            ),
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Color(0xFFEBEBEB),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        FontAwesomeIcons.userLarge,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'your answer ....',
                          suffixIcon: Icon(
                            Icons.send,
                            color: Color(0x90606060),
                            size: 20,
                          ),
                          labelStyle: TextStyle(
                            color: Color(0x90606060),
                          ),
                          filled: true,
                          fillColor: Colors.white,
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
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                    child: Icon(
                     FontAwesomeIcons.userLarge,
                      size: 15,
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
                      Row(
                        children: [
                          Text(
                            'Rose sanei',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '25 jan 2:45 AM',
                            style: TextStyle(
                              color: Color(0xFFA7A7A7),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 320,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                          style: TextStyle(fontSize: 12,color: Colors.grey),
                        ),
                      ),
                      Container(
                        width: 320,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text('see more...'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
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
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
