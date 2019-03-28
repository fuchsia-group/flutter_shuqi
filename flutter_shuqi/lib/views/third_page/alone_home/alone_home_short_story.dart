import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/common/sq_color.dart';




class AloneHomeShortStory extends StatefulWidget {
  @override
  _AloneHomeShortStoryState createState() => _AloneHomeShortStoryState();
}

Widget _drawTitle(){
  return Container(
    height: 35,
    padding: EdgeInsets.only(left: 10),
    alignment: AlignmentDirectional.centerStart,
    child: Text("短篇小数"),
  );
}

List<Widget> _drawItems(){
    List<Map> list = [
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪自封袋的里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
    {"url":"http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg","title":"王菲哪里逃","des":"木贵晨"},
  ];
 return list.map((map){
   return Container(
     height:10 ,
     width: 10,
    // color: SQColor.blue,
    child:Column(
      children: <Widget>[
        Image.network(map["url"]),
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.only(top: 5),
          child: Text(map["title"],style: TextStyle(fontSize: 14,color: SQColor.darkGray),softWrap:false,overflow: TextOverflow.ellipsis,),
        ),
        Container(
           alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.only(top: 5),
          child: Text(map["des"],style: TextStyle(fontSize: 10,color: SQColor.gray)),
        )
      ],
    ),
   ) ;
  }).toList();

  
}


Widget _drawContent(){

  return  Container(
    width: Screen.width,
    height: Screen.width/5*4,
    child:  GridView.count(
      physics:NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      crossAxisCount: 4,
      childAspectRatio: 1/2,
      children:_drawItems()
    )
  ); 

}

class _AloneHomeShortStoryState extends State<AloneHomeShortStory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _drawTitle(),
          _drawContent(),
    
        ],
      ),
    );
  }
}