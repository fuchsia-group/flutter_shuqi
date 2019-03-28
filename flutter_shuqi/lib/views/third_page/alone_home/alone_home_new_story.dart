import 'package:flutter/material.dart';

import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';




class AloneHomeNewStory extends StatefulWidget {
  @override
  _AloneHomeNewStoryState createState() => _AloneHomeNewStoryState();
}

class _AloneHomeNewStoryState extends State<AloneHomeNewStory> {

  Widget _drawTitle(){
    return Container(
      height: 35,
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsets.only(left: 10),
      child: Text("最新发布"),
    );
  }

List<Widget> _drawStoryItems(){
    List<Map> listData=[
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},
      {"image":"http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg","title":"神将之战","autor":"土豆丝炒肉","level":"lv11","updateTime":"51分钟","state":"完结"},

    ];
    return listData.map((map){
      return Container(
        // padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: Screen.width,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 70,
              child: Image.network(map["image"]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(map["title"],style: TextStyle(color: SQColor.darkGray,fontSize: 14),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5,bottom: 5),
                  child: RichText(
                    text: TextSpan(
                      text: map["autor"],
                      style: TextStyle(color: SQColor.gray,fontSize: 12),
                      children:<TextSpan>[
                         TextSpan(text: map["level"], style: TextStyle(fontWeight: FontWeight.bold,color: SQColor.primary)),
                      ]
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    // color: SQColor.red,
                    border: Border.all(color: SQColor.primary,width: 0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(map["state"],style: TextStyle(color: SQColor.gray,fontSize: 10),),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                alignment: AlignmentDirectional.centerEnd,
                child: Text(map["updateTime"]),
              ),
            )
          ],
        ),
      );
    }).toList();
}

  List<Widget> _drawContent(){
    List<Widget> list =List();
    list.add(_drawTitle());
  list.addAll(_drawStoryItems());

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _drawContent(),
      ),
    );
  }
}