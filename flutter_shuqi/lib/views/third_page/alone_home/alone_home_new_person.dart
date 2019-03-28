import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';





class AloneHomeNewPerson extends StatefulWidget {
  @override
  _AloneHomeNewPersonState createState() => _AloneHomeNewPersonState();
}

class _AloneHomeNewPersonState extends State<AloneHomeNewPerson> {

Widget _drawTitle(){
  return Container(
    color: SQColor.white,
    height: 35,
    padding: EdgeInsets.only(left: 10),
    alignment: AlignmentDirectional.centerStart,
    child: Text("新人争锋榜"),
  );
}

Widget _drawContentPageItemTitle(int index){
  return Container(
    color: SQColor.white,
    height: 45,
    alignment: AlignmentDirectional.center,
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: Divider(height: 2,),
        ),
        Container(
          width: 100,
          color: SQColor.white,
          alignment: AlignmentDirectional.center,
          child: Text("热门top4",style: TextStyle(color: SQColor.primary),),
        )
      
      ],
    ),
  );
}

List<Widget> _drawContentPageBookItems(int index){
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


Widget _drawContentPageItem(int index){
   return Container(
     child: Column(
       children: <Widget>[
         _drawContentPageItemTitle(index),
        Row(
          children: _drawContentPageBookItems(index),
        )
       ],
     ),
   );
  
}
Widget _drawContentPage(int index){
  return Container(
      child: _drawContentPageItem(index)
  );
}


Widget _drawContent(){
  return  Container(
    width: Screen.width,
    height: 190,
     child: PageView.builder(
      itemBuilder: (BuildContext context,int index){
        return _drawContentPage(index);
      },
      itemCount: 4,
      ),
   );
}
  Widget _drawFindMore(){
    return Container(
      height: 45,
      alignment: AlignmentDirectional.center,
      child: Text("查看更多"),
    );
  }
  
  Widget _drawSpaceContent(){
    return Container(
      width: Screen.width,
      height: 30,
      // ,
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
          Divider(height: 2,),
          _drawFindMore()
        ],
      ),
    );
  }
}