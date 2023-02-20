import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

class questionBox extends StatefulWidget {
  const questionBox({Key? key}) : super(key: key);

  @override
  State<questionBox> createState() => _questionBoxState();
}

class _questionBoxState extends State<questionBox> {
  final List<String> items = [
    'Tech',
    'Phone',
    'IT',
    'Apple',
    'Car',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  'Ask Question ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    FontAwesomeIcons.userLarge,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Shayan ajr',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.tags,
                          size: 16,
                          color: Color(0xFFBB2226),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Tag',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFBB2226),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFBB2226),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      FontAwesomeIcons.chevronDown,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Color(0xFFBB2226),
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 50,
                    buttonWidth: 150,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    buttonElevation: 2,
                    itemHeight: 30,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 150,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Title question',
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Description question',
                  labelStyle: TextStyle(height: 0.1),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(25),
              color: Colors.grey,
              //color of dotted/dash line
              strokeWidth: 3,
              //thickness of dash/dots
              dashPattern: [10, 6],
              child: Container(
                width: 350,
                height: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Uploading image',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 350,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBB2226),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
