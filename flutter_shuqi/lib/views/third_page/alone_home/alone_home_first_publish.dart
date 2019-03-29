import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/views/common/page_control.dart';

class AloneHomeFirstPublish extends StatefulWidget {
  @override
  _AloneHomeFirstPublishState createState() => _AloneHomeFirstPublishState();
}

class _AloneHomeFirstPublishState extends State<AloneHomeFirstPublish> {

PageController pgcl ;
int currentPage=0;
@override
void initState(){
  super.initState();
  pgcl =PageController();
  pgcl.addListener((){
      double offset =pgcl.offset;
  
    List pageIndex = [0,1,2,3];
    for (int index in pageIndex) {
      if (offset ==Screen.width*index) {
           setState(() {
          currentPage = index;
        });
      }
    }
  });
}



 @override
  void dispose() {
    pgcl.dispose();
    super.dispose();
  }

Widget _drawTitle(){
  return Container(
    alignment: AlignmentDirectional.centerStart,
    padding: EdgeInsets.only(left: 10),
    height: 35,
    child: Text("独家首发"),
  );
}

List<Widget> _drawContentPageItems(int index){
  List<Map> list =[
    {"url":"http://img-tailor.11222.cn/bcv/big/201608311048233790.jpg","title":"极品天医","des":"真贱"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201608311048233790.jpg","title":"极品天医","des":"真贱"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201608311048233790.jpg","title":"极品天医","des":"真贱"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201608311048233790.jpg","title":"极品天医","des":"真贱"},
  ];
  return list.map((map){
    return Expanded(
      child: Container(
        padding:EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: Screen.width/4-15,
            child:  Image.network(map["url"]),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(map["title"],style: TextStyle(fontSize: 14,color: SQColor.darkGray),)
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(map["des"],style: TextStyle(fontSize: 10,color: SQColor.gray),),
          )
        ],
      ),
    )
    );
  }).toList();
  
}

Widget _drawContentPage(int index){
  return Row(
    children:  _drawContentPageItems(index),
  );
}

Widget _drawContent(){
  return Container(
    width: Screen.width,
    height: 150,
     child: PageView.builder(
       controller: pgcl,
      itemBuilder: (BuildContext context,int index){
        return _drawContentPage(index);
      },
      itemCount: 4,
      ),
   );
}
  
  Widget _drawSpaceContent(){
    return Container(
      width: Screen.width,
      height: 30,
      child: PageControl(
        currentPage: currentPage,
        pageCount: 4,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _drawTitle(),
          _drawContent(),
          _drawSpaceContent(),
        ],
      ),
    );
  }
}