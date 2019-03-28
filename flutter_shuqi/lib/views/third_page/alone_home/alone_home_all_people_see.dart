import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';




class AloneHomeAllPeopleSee extends StatefulWidget {
  @override
  _AloneHomeAllPeopleSeeState createState() => _AloneHomeAllPeopleSeeState();
}

Widget _drawTitle(){
  return Container(
    alignment: AlignmentDirectional.centerStart,
    height: 35,
    padding: EdgeInsets.only(left: 10),
    child: Text("大家都在看"),
  );
}

List<Widget> _drawLabelItems(){
  List<Map> listData = [
    {"title":"幻想","lineColor":SQColor.gray,"backgournd":SQColor.white},
    {"title":"幻想","lineColor":SQColor.blue,"backgournd":SQColor.orange},
    {"title":"幻想","lineColor":SQColor.blue,"backgournd":SQColor.white},
    {"title":"幻想","lineColor":SQColor.primary,"backgournd":SQColor.orange},
    {"title":"幻想","lineColor":SQColor.primary,"backgournd":SQColor.white},
    {"title":"","lineColor":SQColor.white,"backgournd":SQColor.white},
    {"title":"幻想","lineColor":SQColor.blue,"backgournd":SQColor.orange},
    {"title":"幻想","lineColor":SQColor.white,"backgournd":SQColor.orange},
    {"title":"幻想","lineColor":SQColor.blue,"backgournd":SQColor.white},
    {"title":"","lineColor":SQColor.white,"backgournd":SQColor.white},
  ];
   return listData.map((map){
     return Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: map["backgournd"],
            border: Border.all(width: 0.5,color: map["lineColor"]),
            borderRadius: BorderRadius.all(Radius.circular(3))
            ),
          // color: SQColor.blue,
          child: Text(map["title"],style: TextStyle(color: map["lineColor"]),),
        );
  }).toList();
}

Widget _drawContent(){
  return Container(
    height: 70,
    child: GridView.count(
      physics:NeverScrollableScrollPhysics(),
      crossAxisCount: 5,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio :5/2,
      padding: EdgeInsets.symmetric(horizontal: 30),
      children: _drawLabelItems(),
    ),
  );
}

Widget _drawMore(){
  return Container(
    height: 45,
    alignment: AlignmentDirectional.center,
    child: Text("查看更多"),
  );
}


class _AloneHomeAllPeopleSeeState extends State<AloneHomeAllPeopleSee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _drawTitle(),
          _drawContent(),
          Divider(height: 2,),
          _drawMore(),
        ],
      ),
    );
  }
}

