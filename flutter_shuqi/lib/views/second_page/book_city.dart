import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';

class BookCity extends StatefulWidget {
  @override
  _BookCityState createState() => _BookCityState();
}

class _BookCityState extends State<BookCity> {
  PageController pgtl;
  static List<String> topicList = ["精选", "女生", "男生", "漫画"];
  int currentPage = 0;
  double silerWidth = 20;
  @override
  void initState() {
    super.initState();
    pgtl = PageController();
    pgtl.addListener(() {
      double offset = pgtl.offset;

      double mm = offset % Screen.width;

      setState(() {
        silerWidth = 20 + mm / 4+ currentPage*50;
        print("$silerWidth");
      });

      List pageIndex = [0, 1, 2, 3];
      for (int index in pageIndex) {
        if (offset == Screen.width * index) {
          setState(() {
            currentPage = index;
          });
        }
      }
    });
  }

  void _barItemTap(int index){
    print("mm");
    pgtl.jumpToPage(index);
  }


  List<Widget> _drawBarItems() {
    List<Widget> list = [];
    for (int i = 0; i < topicList.length; i++) {
      String topic = topicList[i];
      Widget t;
      if (currentPage == i) {
        t =InkWell(
          onTap: (){
            _barItemTap(i);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10), child: Text(topic)) ,
        );
        
      } else {
        t =InkWell(
          onTap: (){
            _barItemTap(i);
          },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              topic,
              style: TextStyle(color: SQColor.red),
            ))
        );
      }

      list.add(t);
    }
    return list;
  }

  Widget _drawBar() {
    return Container(
      height: Screen.navigationBarHeight,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          InkWell(
            onTap: null,
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              width: Screen.width,
              // alignment: EdgeInsets.only(right: 10),
              padding: EdgeInsets.only(top: 20, right: 10),
              child: Image.asset("images/home_search.png"),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _drawBarItems(),
                  ),
                  // Container(
                  //   height: 20,
                  //   width: Screen.width - 100,
                  //   color: SQColor.primary,
                  //   child: Stack(
                  //     children: <Widget>[
                  //       Container(
                  //         width: silerWidth,
                  //         height: 10,
                  //         color: SQColor.white,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              )),
        ],
      ),
    );
  }

  Widget _drawPageListView() {
    return Container(
      width: Screen.width,
      // padding: EdgeInsets.only(top: 100),
      child: PageView.builder(
        controller: pgtl,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            width: Screen.width,
            child: Text("data${i}"),
          );
        },
        itemCount: topicList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
      
        _drawPageListView(),
          _drawBar(),
      ],
    );
  }
}
