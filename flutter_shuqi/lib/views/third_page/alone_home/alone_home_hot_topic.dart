import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/common/sq_color.dart';






class AloneHomeHotTopic extends StatefulWidget {
  @override
  _AloneHomeHotTopicState createState() => _AloneHomeHotTopicState();
}

class _AloneHomeHotTopicState extends State<AloneHomeHotTopic> {

Widget _drawTitle(){
  return Container(
    height: 35,
    alignment: AlignmentDirectional.centerStart,
    child: Text("热门话题"),
  );
}

  List<Widget> _drawContentList(){
    List<Map> listData = [
      {"title":"今年，你看过啊写新的小说类型?","des":"hi,书友好，今年，你看过那些新的小说类型吗，楼主最近文荒啦，除了谷大幅度啊的啊发的阿发达的发啊的啊啊","url":"http://img-tailor.11222.cn/pm/book/operate/2019010411005413.jpg"},
      {"title":"今年，你看过啊写新的小说类型?","des":"hi,书友好，今年，你看过那些新的小说类型吗，楼主最近文荒啦，除了谷大幅度啊的啊发的阿发达的发啊的啊啊","url":"http://img-tailor.11222.cn/pm/book/operate/2019010411005413.jpg"},
      {"title":"今年，你看过啊写新的小说类型?","des":"hi,书友好，今年，你看过那些新的小说类型吗，楼主最近文荒啦，除了谷大幅度啊的啊发的阿发达的发啊的啊啊","url":"http://img-tailor.11222.cn/pm/book/operate/2019010411005413.jpg"},
    ];
   return listData.map((map){
     return Container(
       height: 100,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Expanded(
             child:  Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Container(
                 alignment: AlignmentDirectional.centerStart,
                 child: Text(map["title"],style: TextStyle(fontSize: 14,color: SQColor.darkGray),),
               ),
              
                 Container(
                   padding: EdgeInsets.only(top: 5),
                 child: Text(map["des"],overflow: TextOverflow.ellipsis,maxLines:2,style: TextStyle(fontSize: 12,color: SQColor.gray),),
               
               )
               
             ],
           ),
           ),
          
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(5),
            child: Image.network(map["url"],fit: BoxFit.fill,),
          )
         ],
       ),
     );
    }).toList();
  }

  Widget _drawFindMore(){
    return Container(
      height: 45,
      alignment: AlignmentDirectional.center,
      child: Text("查看更多"),
    );
  }

  List<Widget> _drawHotTopic(){
    List<Widget> list =List();
    Widget title = _drawTitle();
    list.add(title);
    
  List<Widget> contentList = _drawContentList();
  
  for (Widget widget in contentList) {
    list.add(widget);
    list.add(Container(
      padding: EdgeInsets.only(left: 10),
      child: Divider(height: 2,),
    ));
  }
  list.add(_drawFindMore());
  
    return list;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: _drawHotTopic(),
      ),
    );
  }
}