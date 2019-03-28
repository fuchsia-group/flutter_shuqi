import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/screen.dart';

import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_banner.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_first_publish.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_short_story.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_hot_topic.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_new_person.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_all_people_see.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home_new_story.dart';

class AloneHome extends StatefulWidget {
  @override
  _AloneHomeState createState() => _AloneHomeState();
}



class _AloneHomeState extends State<AloneHome> {

  Widget _drawGrayContent(){
    return Container(
      width: Screen.width,
      height: 10,
      color: SQColor.lightGray,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: SQColor.white,
        elevation:0.0,
        actions: <Widget>[
        InkWell(
                onTap: null,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset("images/home_search.png"),
                    )
                  ],
                ),
              ),
        ],
        // backgroundColor: SQColor.white,
        title: Text("独家",style:TextStyle(fontSize:14,color:SQColor.darkGray),
        ),
      ),
      //  body: AloneHomeFirstPublish(),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          if (index==0) {
            return AloneHomeBanner();
          }
          if (index == 1) {
            return AloneHomeFirstPublish();
          }
         if (index == 3) {
           return AloneHomeShortStory();
         }
        if (index == 5) {
        return AloneHomeHotTopic();
        }
        if (index == 7) {
          return AloneHomeNewPerson();
        }
        if (index == 9) {
          return AloneHomeAllPeopleSee();
        }
        if (index == 11){
          return AloneHomeNewStory();
        }
          return _drawGrayContent();
        },

        itemCount: 13,
      ),
    );
  }
}