import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:oghala/Tags.dart';
import 'package:get/get.dart';

class tagList extends StatefulWidget {
  const tagList({Key? key}) : super(key: key);

  @override
  State<tagList> createState() => _tagListState();
}

class _tagListState extends State<tagList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFBB2226)),
              height: 300,
            ),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 50),
                  child: Text(
                    'Question Tags',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(15),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Category category = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:Color(0xFFD3D3D3)
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Icon(category.icon,size: 30,color: Colors.grey,),
                          SizedBox(height: 20,),
                          Text(category.name,
                            textAlign: TextAlign.center,
                            maxLines: 3,)
                        ],
                      ),
                    );
                  },
                    childCount: 6
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
