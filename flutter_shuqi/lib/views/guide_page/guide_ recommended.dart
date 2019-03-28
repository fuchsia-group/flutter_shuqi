import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/views/first_page/home.dart';

class GuideRecommendedPage extends StatefulWidget {
  GuideRecommendedPage({Key key}) : super(key: key);

  @override
  createState() => _GuideRecommendedPageState();
}

class _GuideRecommendedPageState extends State<GuideRecommendedPage> {
  ScrollController _controller = ScrollController();

  bool showBorder = false;

  final List _items = [
    {
      "img": "bookshelf_bg.png",
      "bookName": "第七任新娘",
      "bookDesc": "*精华简介*白慕晴从小听说过一个传言，C城最有名望的南宫家富可敌国...",
      "typeName": "现言人气榜最热",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "灵田农女小当家",
      "bookDesc": "意外获得灵田一块，郦芜蘅开启了异世的种田发家之路。无奈白莲花一般的...",
      "typeName": "古言类畅销书",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "第七任新娘",
      "bookDesc": "*精华简介*白慕晴从小听说过一个传言，C城最有名望的南宫家富可敌国...",
      "typeName": "现言人气榜最热",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "灵田农女小当家",
      "bookDesc": "意外获得灵田一块，郦芜蘅开启了异世的种田发家之路。无奈白莲花一般的...",
      "typeName": "古言类畅销书",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "第七任新娘",
      "bookDesc": "*精华简介*白慕晴从小听说过一个传言，C城最有名望的南宫家富可敌国...",
      "typeName": "现言人气榜最热",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "灵田农女小当家",
      "bookDesc": "意外获得灵田一块，郦芜蘅开启了异世的种田发家之路。无奈白莲花一般的...",
      "typeName": "古言类畅销书",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "第七任新娘",
      "bookDesc": "*精华简介*白慕晴从小听说过一个传言，C城最有名望的南宫家富可敌国...",
      "typeName": "现言人气榜最热",
    },
    {
      "img": "bookshelf_bg.png",
      "bookName": "灵田农女小当家",
      "bookDesc": "意外获得灵田一块，郦芜蘅开启了异世的种田发家之路。无奈白莲花一般的...",
      "typeName": "古言类畅销书",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 100 && showBorder) {
        setState(() {
          showBorder = false;
        });
      } else if (_controller.offset >= 100 && showBorder == false) {
        setState(() {
          showBorder = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(color: SQColor.white),
          preferredSize: Size(Screen.width, 0),
        ),
        body: Stack(
          children: <Widget>[
            Scrollbar(
              child: SingleChildScrollView(
                  controller: _controller,
                  child: Container(
                    color: Color(0xfff9f9f9),
                    child: Column(
                      children: <Widget>[_buildTop(), _buildBody()],
                    ),
                  )),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HemoPage();
                  }));
                },
                child: Text(
                  "立即进入",
                  style: TextStyle(color: Color(0xffb6b6b6)),
                ),
                shape: showBorder ? Border.all(color: Colors.grey) : null,
                color: showBorder ? Colors.grey[200] : Colors.transparent,
              ),
            )
          ],
        ));
  }

  Widget _buildTop() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      constraints: BoxConstraints.tight(Size.fromHeight(130.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("为你准备8本好书",
              style: TextStyle(
                  color: Color(0xff161724),
                  fontSize: 20,
                  fontStyle: FontStyle.normal)),
          SizedBox(
            height: 10,
          ),
          Text(
            "新用户好书免费读",
            style: TextStyle(color: Color(0xffdfdee3)),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: _items.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(item) {
    var width = Screen.width;
    return Container(
        width: width,
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("images/bookshelf_bg.png",
                      width: 80, height: 110, fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item["bookName"],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          item["bookDesc"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(color: Color(0xff666666)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            item["typeName"],
                            style: TextStyle(
                                color: Color(0xffe6a369), fontSize: 10),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Color(0xffe6a369))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              color: Color(0xfffcfcfc),
              height: 1,
            ),
            Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("加书架",
                        style:
                            TextStyle(color: Color(0xff00ae89), fontSize: 16)),
                    Container(
                      color: Color(0xfffcfcfc),
                      width: 1,
                      height: 20,
                    ),
                    Text("读读看",
                        style:
                            TextStyle(color: Color(0xff00ae89), fontSize: 16))
                  ],
                ))
          ],
        ));
  }
}
